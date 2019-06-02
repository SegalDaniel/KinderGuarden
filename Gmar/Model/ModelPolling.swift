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
    
    func startPollingAlerts() {
        print("start polling alerts")
        DispatchQueue.global(qos: .background).async {
            let timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector:  #selector(self.poolAlerts), userInfo: nil, repeats: true)
            let runLoop = RunLoop.current
            runLoop.add(timer, forMode: .default)
            runLoop.run()
        }
    }
    
    //still sending alerts that exist in core data
    @objc func poolAlerts(){
        print("pooling alerts")
        var newAlerts:[Alert] = []
        self.getAlerts { (alerts) in
            alerts.forEach({ (alert) in
                if (alert.level != -1 || alert.level != Int16("-1")) && (alert.type == 2 || alert.type == Int16("2")){
                    newAlerts.append(alert)
                }
            })
            if newAlerts.count > 0{
                ModelNotification.immidiateAlert.notify(data: newAlerts)
            }
        }
    }
}
