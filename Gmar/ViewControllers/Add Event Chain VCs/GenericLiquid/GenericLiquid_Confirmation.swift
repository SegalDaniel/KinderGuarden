//
//  GenericLiquid_Confirmation.swift
//  Gmar
//
//  Created by Zach Bachar on 17/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

extension GenericLiquidViewController{
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        let loadingAlert = Utility.getLoadingAlert()
        self.present(loadingAlert, animated: true, completion: nil)
        let amount = quantityLabel.text!
        if amount == "כמות"{
            showUnselectedAlert(dismiss: loadingAlert)
            return
        }
        let eventDate:Date = getEventDate()
        switch kind {
        case .milk:
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.milk.rawValue)
                    let liquidFood = LiquidFood(mealType: "milk", amount: nil, consumedAmount: amount, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: liquidFood) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
        case .tamal:
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.tamal.rawValue)
                    let liquidFood = LiquidFood(mealType: "tamal", amount: nil, consumedAmount: amount, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: liquidFood) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
        case .feever:
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.feever.rawValue)
                    let fever = Fever(tempreture: amount, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: fever) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
        case .water:
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.water.rawValue)
                    let water = Water(amount: nil, consumedAmount: amount, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: water) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
        default:
            loadingAlert.dismiss(animated: true) {
                self.performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
            }
            break
        }
    }
}
