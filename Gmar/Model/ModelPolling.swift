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
        let queue = DispatchQueue.global(qos: .background)
        let timer = DispatchSource.makeTimerSource(queue: queue)
        timer.schedule(deadline: .now(), repeating: .seconds(100), leeway: .seconds(1))
        timer.setEventHandler(handler: {
            // Your code
        })
        timer.resume()
    }
    
    func pollAlerts(){
        
    }
}
