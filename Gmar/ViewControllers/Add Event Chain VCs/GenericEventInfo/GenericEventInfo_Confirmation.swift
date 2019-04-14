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
        switch kind {
        //MARK: - Attandance
        case .attandance:
            let typeLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
            let authLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
            let authText = authLabel.text!
            let type = typeLabel.text!
            if authText == "" || type == ""{
                showUnselectedAlert(dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    var isLate:Bool = false
                    let pickup = DateAdmin.createTime(from: child.pickupHour!)!
                    var eventTime:Date
                    let eventDate:Date = getEventDate()
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
                        let event = Attendance(isLate: isLate, type: type, eventDate: eventDate, child: child, staff: staff, authorized: auth)
                        Model.instance.sendToFB(attandanceEvent: event, callack: { (err) in
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
                showUnselectedAlert(dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    let eventType:Int16 = Int16(Enums.BasicEvent.cough.rawValue)
                    let eventDate:Date = getEventDate()
                    let event = Cough(type: type, eventType: eventType ,eventDate: eventDate as NSDate, child: child, staff: staff)
                    Model.instance.sendToFB(basicEvent: event) { (err) in
                        self.sendToFBCallback(err, loadingAlert: loadingAlert)
                    }
                }
            }
            break
            
        case .feces:
            let poo = isOn["poo"]!
            let pee = isOn["pee"]!
            if !poo && !pee{
                showUnselectedAlert(dismiss: loadingAlert)
                return
            }
            if let child = child{
                if let staff = staff{
                    let eventDate = getEventDate()
                    if poo{
                        let pooEventType:Int16 = Int16(Enums.BasicEvent.feces.rawValue)
                        let colorLabel = self.labelStackView.arrangedSubviews[0] as! UILabel
                        let textureLabel = self.labelStackView.arrangedSubviews[1] as! UILabel
                        let amountLabel = self.labelStackView.arrangedSubviews[2] as! UILabel
                        let color = colorLabel.text!
                        let texture = textureLabel.text!
                        let amount = amountLabel.text!
                        if color == "צבע" || texture == "מרקם" || amount == "כמות"{
                            showUnselectedAlert(dismiss: loadingAlert)
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
                                showUnselectedAlert(dismiss: loadingAlert)
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
                            showUnselectedAlert(dismiss: loadingAlert)
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
        default:
            loadingAlert.dismiss(animated: true) {
                self.performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
            }
            break
        }
        
    }
    
    //MARK: - sendToFB callback
    func sendToFBCallback(_ err:Error?, loadingAlert:UIAlertController){
        loadingAlert.dismiss(animated: true) {
            if err == nil{
                self.performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
            }
            else{
                self.showErrorAlert(errorDescription: err!.localizedDescription)
            }
        }
    }
    
    //MARK: - Event Date Handler
    func getEventDate() -> Date{
        var eventDate:Date
        if selectedDate == nil{
            eventDate = Date()
        }
        else{
            eventDate = selectedDate!
        }
        return eventDate
    }
    
    //MARK: - Alert
    func showUnselectedAlert(dismiss loadingAlert:UIAlertController){
        let alert = SimpleAlert(_title: "רק רגע", _message: "נא למלא את כל הפרטים הנדרשים", dissmissCallback: nil).getAlert()
        loadingAlert.dismiss(animated: true) {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showErrorAlert(errorDescription:String){
        let alert = SimpleAlert(_title: "רק רגע", _message: errorDescription, dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }

}
