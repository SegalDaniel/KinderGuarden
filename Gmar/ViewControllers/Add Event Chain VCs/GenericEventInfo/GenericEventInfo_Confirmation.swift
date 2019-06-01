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
        let loadingAlert = Utility.getLoadingAlert()
        self.present(loadingAlert, animated: true, completion: nil)
        let eventDate:Date = getEventDate()
        switch kind {
        //MARK: - Attandance
        case .attandance:
            let typeLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
            let authLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
            let authText = authLabel.text!
            let type = typeLabel.text!
            if authText == "מלווה" || type == ""{
                showUnselectedAlert(type: "מלווה" , dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    var isLate:Bool = false
                    let pickup = DateAdmin.createTime(from: child.pickupHour!)!
                    var eventTime:Date
                    if selectedTime == nil{
                        eventTime = DateAdmin.createTime(from:DateAdmin.currentTime(timeStyle: .short))!
                    }
                    else{
                        eventTime = DateAdmin.createTime(from: selectedTime!)!
                    }
                    isLate = eventTime > pickup
                    if type == "הגעה"{
                        child.isAttend = true
                    }
                    else if type == "עזיבה"{
                        child.isAttend = false
                    }
                    
                    
                    let authName:String = String(authLabel.text!.split(separator: " ")[1])
                    Model.instance.getAuthorized(authName: authName) { (auth) in
                        let eventType:Int16 = Int16(Enums.BasicEvent.attandance.rawValue)
                        let event = Attendance(type: type, isLate: isLate, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff, authorized: auth)
                        Model.instance.sendToFB(basicEvent: event, callback: { (err) in
                            self.sendToFBCallback(err, loadingAlert: loadingAlert)
                        })
                    }
                }
            }
            break
            
        //MARK: - Cough
        case .cough:
            let typeLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
            let type = typeLabel.text!
            if type == "סוג"{
                showUnselectedAlert(type: type, dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.cough.rawValue)
                    let event = Cough(type: type, eventType: eventType ,eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: event) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
            
        //MARK: - Feces
        case .feces:
            let poo = isOn["poo"]!
            let pee = isOn["pee"]!
            if !poo && !pee{
                showUnselectedAlert(type: "צרכים", dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    if poo{
                        let pooEventType:Int16 = Int16(Enums.BasicEvent.feces.rawValue)
                        let colorLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
                        let textureLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
                        let amountLabel = self.labelStackView.arrangedSubviews[2] as! UILabel
                        let color = colorLabel.text!
                        let texture = textureLabel.text!
                        let amount = amountLabel.text!
                        if color == "צבע" || texture == "מרקם" || amount == "כמות"{
                            showUnselectedAlert(type: "צבע כמות ומרקם", dismiss: loadingAlert)
                            return
                        }
                        if pee{
                            let peeEventType:Int16 = Int16(Enums.BasicEvent.urine.rawValue)
                            let pColorLabel = self.labelStackView.arrangedSubviews[3] as! UILabel
                            let pFragranceLabel = self.labelStackView.arrangedSubviews[4] as! UILabel
                            let pAmountLabel = self.labelStackView.arrangedSubviews[5] as! UILabel
                            let pColor = pColorLabel.text!
                            let pFragrance = pFragranceLabel.text!
                            let pAmount = pAmountLabel.text!
                            if pColor == "צבע שתן" || pFragrance == "ריח שתן" || pAmount == "כמות שתן"{
                                showUnselectedAlert(type: "שתן", dismiss: loadingAlert)
                                return
                            }
                            let urine = Urine(color: pColor, fragrance: pFragrance, amount: pAmount, eventType: peeEventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                            Model.instance.sendToFB(basicEvent: urine) { (err) in
                                let feces = Feces(color: color, texture: texture, amount: amount, eventType: pooEventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                                Model.instance.sendToFB(basicEvent: feces) { (err) in
                                    self.sendToFBCallback(err, loadingAlert: loadingAlert)
                                }
                            }
                        }
                        else{
                            let feces = Feces(color: color, texture: texture, amount: amount, eventType: pooEventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                            Model.instance.sendToFB(basicEvent: feces) { (err) in
                                self.sendToFBCallback(err, loadingAlert: loadingAlert)
                            }
                        }
                    }
                    else{
                        let peeEventType:Int16 = Int16(Enums.BasicEvent.urine.rawValue)
                        let pColorLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
                        let pFragranceLabel = self.labelStackView.arrangedSubviews[2] as! UILabel
                        let pAmountLabel = self.labelStackView.arrangedSubviews[3] as! UILabel
                        let pColor = pColorLabel.text!
                        let pFragrance = pFragranceLabel.text!
                        let pAmount = pAmountLabel.text!
                        if pColor == "צבע שתן" || pFragrance == "ריח שתן" || pAmount == "כמות שתן"{
                            showUnselectedAlert(type: "שתן", dismiss: loadingAlert)
                            return
                        }
                        let urine = Urine(color: pColor, fragrance: pFragrance, amount: pAmount, eventType: peeEventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                        Model.instance.sendToFB(basicEvent: urine) { (err) in
                            self.sendToFBCallback(err, loadingAlert: loadingAlert)
                        }
                    }
                }
            }
            break
            
        //MARK: - SolidFood
        case .solidFoods:
            let amountLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
            let amount = amountLabel.text!
            if amount == "כלום"{
                showUnselectedAlert(type: "כמות", dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    let consumed = amount
                    let type = (self.labelStackView.arrangedSubviews[0] as! UILabel).text!
                    let eventType:Int16 = Int16(Enums.BasicEvent.solidFoods.rawValue)
                    let solidFood = SolidFood(mealType: type, mealInMenu: nil, amount: nil, consumedAmount: consumed, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: solidFood) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
        //MARK: - Sleep
        case .sleep:
            let scopeLabel = self.labelStackView.arrangedSubviews[2] as! UILabel
            let allocLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
            let allocated = allocLabel.text!
            let scope = scopeLabel.text!
            if allocated == "אורך השינה" || scope == "איכות השינה"{
                showUnselectedAlert(type: "שינה", dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.sleep.rawValue)
                    let typeLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
                    let type = typeLabel.text!
                    let sleep = Sleep(type: type, allocatedTime: allocated, sleepingScope: scope, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: sleep) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
        //MARK: - Rash
        case .rash:
            let typeLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
            let areaLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
            let type = typeLabel.text!
            let area = areaLabel.text!
            if type == "סוג" || area == "איזור"{
                showUnselectedAlert(type: "סוג ואזור", dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.rash.rawValue)
                    let rash = Rash(type: type, area: area, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: rash) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
        break
        //MARK: - Vomit
        case .vomit:
            let typeLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
            let type = typeLabel.text!
            if type == "סוג"{
                showUnselectedAlert(type: "סוג", dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.vomit.rawValue)
                    let vomit = Vomitus(type: type, proper: "", eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: vomit) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
        //MARK: - Hafrasha
        case .hafrahsa:
            let typeLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
            let areaLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
            
            let type = typeLabel.text!
            let area = areaLabel.text!
            
            if type == "סוג" || area == "איזור"{
                showUnselectedAlert(type: "סוג איזור", dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.hafrahsa.rawValue)
                    let hafrasha = Secretion(type: type, area: area, rank: "", eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: hafrasha) { (err) in
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
