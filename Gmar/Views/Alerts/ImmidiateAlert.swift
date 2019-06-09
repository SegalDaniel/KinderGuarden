//
//  ImmidiateAlert.swift
//  Gmar
//
//  Created by Zach Bachar on 02/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

class ImmidiateAlert{
    
    private let alertController:UIAlertController
    let alert:Alert
    
    init(alert:Alert, dissmiss:(()->Void)?, done:(()->Void)?, title:String = "התראה לפעולה מיידית!"){
        self.alert = alert
        alertController = UIAlertController(title: title + " \(alert.child!.firstName!) \(alert.child!.lastName!)", message: alert.actionNeeded!, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "דחה", style: .destructive, handler: { (action) in
            if let cb = dissmiss{
                cb()
            }
        }))
        alertController.addAction(UIAlertAction(title: "בוצע!", style: .default, handler: { (action) in
            alert.level = Int16(-1)
            Model.instance.saveToDB(callback: { (err) in
                if let cb = done{
                    cb()
                }
            })
        }))
    }
    
    
    func getAlert()->UIAlertController{
        return alertController
    }
    
    static func ==(lhs:ImmidiateAlert, rhs:ImmidiateAlert) -> Bool{
        return lhs.alert == rhs.alert
    }
}
