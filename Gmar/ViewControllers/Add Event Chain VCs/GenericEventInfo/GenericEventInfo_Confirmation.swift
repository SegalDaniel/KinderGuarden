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
                loadingAlert.dismiss(animated: true) {
                    self.showUnselectedAlert()
                }
                return
            }
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
                            loadingAlert.dismiss(animated: true, completion: nil)
                            self.performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
                        })
                    }
                }
            }
            break
        default:
            performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
            break
        }
        
    }
    
    //MARK: - Alert
    func showUnselectedAlert(){
        let alert = SimpleAlert(_title: "רק רגע", _message: "נא למלא את כל הפרטים הנדרשים", dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }

}
