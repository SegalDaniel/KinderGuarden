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
    
   //MARK: - Start & Stop polling
    func startPollingAlerts() {
        print("start polling alerts")
        DispatchQueue.global(qos: .background).async {
            let timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector:  #selector(self.poolAlerts), userInfo: nil, repeats: true)
            let runLoop = RunLoop.current
            runLoop.add(timer, forMode: .default)
            runLoop.run()
            
        }
    }
    
    func startPollingPulseAlerts(){
        print("start polling pulse alerts")
        DispatchQueue.global(qos: .background).async {
            self.pulseAlertTimerLoop = Timer.scheduledTimer(timeInterval: 1, target: self, selector:  #selector(self.poolMultiPulseAlerts), userInfo: nil, repeats: true)
            let runLoop = RunLoop.current
            runLoop.add(self.pulseAlertTimerLoop!, forMode: .default)
            runLoop.run()
            
        }
    }
    
    func startPollingBasicEvents(){
        print("start polling Basic Events")
        DispatchQueue.global(qos: .background).async {
            let timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector:  #selector(self.poolBasicEvents), userInfo: nil, repeats: true)
            let runLoop = RunLoop.current
            runLoop.add(timer, forMode: .default)
            runLoop.run()
            
        }
    }
    
    func stopPulseAlertPolling() {
        print("stop polling pulse alerts")
        if let timer = pulseAlertTimerLoop{
            timer.invalidate()
        }
    }
    
    //MARK: - Polling Jobs
    @objc func poolAlerts(){
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
    
    @objc func poolPulseAlerts(){
        self.getPulseAlert { (pulse) in
            ModelNotification.pulseAlert.notify(data: pulse)
        }
    }
    
    @objc func poolMultiPulseAlerts(){
        self.getMultiPulseAlerts { (count, pulses) in
            let arr = pulses.map({ (pulse) -> Int in
                return Int(truncating: pulse as! NSNumber)
            })
            ModelNotification.multiPulseAlerts.notify(data: (count, arr))
        }
    }
    
    @objc func poolBasicEvents(){
        Model.instance.getAllChildsFromCore { (childs) in
            childs.forEach({ (child) in
                self.getBasicEventsFromServer(childID: child.childID!, callback: { (events) in })
            })
        }
    }
}
