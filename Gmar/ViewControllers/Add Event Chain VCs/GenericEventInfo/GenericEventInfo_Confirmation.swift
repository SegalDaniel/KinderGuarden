//
//  GenericEventInfo_Confirmation.swift
//  Gmar
//
//  Created by Zach Bachar on 09/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

extension GenericEventInfoViewController{
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        print("confirm clicked")
        switch kind {
        case .attandance:
            if let child = child{
                if let staff = staff{
                    var isLate:Bool = false
                    let pickup = DateAdmin.createTime(from: child.pickupHour!)!
                    var eventTime:Date
                    var eventDate:Date
                    if selectedTime == nil{
                        eventTime = DateAdmin.createTime(from:DateAdmin.currentTime(timeStyle: .short))!
                    }
                    else{
                        eventTime = DateAdmin.createTime(from: selectedTime!)!
                    }
                    isLate = eventTime > pickup
                    if selectedDate == nil{
                        eventDate = Date()
                    }
                    else{
                        eventDate = selectedDate!
                    }
                    let typeLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
                    let type = typeLabel.text!
                    if type == "הגעה"{
                        child.isAttend = true
                    }
                    else if type == "עזיבה"{
                        child.isAttend = false
                    }
                    
                    let authLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
                    let authName:String = String(authLabel.text!.split(separator: " ")[1])
                    Model.instance.getAuthorized(authName: authName) { (auth) in
                        let _ = Attendance(isLate: isLate, type: type, eventDate: eventDate, child: child, staff: staff, authorized: auth)
                        Model.instance.saveToDB(callback: nil)
                        self.performSegue(withIdentifier: "unwindToSelectKid", sender: nil)
                    }
                }
            }
            break
        default:
            performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
            break
        }
        
    }
    
}
