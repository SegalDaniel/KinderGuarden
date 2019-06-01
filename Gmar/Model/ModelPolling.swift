//
//  ModelPolling.swift
//  Gmar
//
//  Created by Zach Bachar on 01/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

extension Model{
    
    func startPolling() {
        print("start polling")
        DispatchQueue.global(qos: .background).async {
            let timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector:  #selector(self.poolAlerts), userInfo: nil, repeats: true)
            let runLoop = RunLoop.current
            runLoop.add(timer, forMode: .default)
            runLoop.run()
        }
    }
    
    //still sending alerts that exist in core data
    @objc func poolAlerts(){
        print("pooling alerts")
        self.modelHttp.getAlerts(callback: { (alerts) in
            var newAlerts:[Alert] = []
            alerts.forEach({ (alert) in
                if self.isAlertExist(alert: alert){
                    newAlerts.append(alert)
                }
            })
            ModelNotification.immidiateAlert.notify(data: newAlerts)
        })
    }
}
