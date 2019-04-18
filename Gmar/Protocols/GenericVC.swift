//
//  GenericViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

class GenericVC: MyViewController {
    var kind:Enums.BasicEvent = .UKNOWN
    let datePicker = UIDatePicker()
    var teacherID:String?
    var childID:String?
    var eventObjectsListener:NSObjectProtocol?
    var child:Child?
    var staff:Staff?
    var selectedTime:String?
    var selectedDate:Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventObjectsListener = ModelNotification.childAndStaffNotification.observe(cb: { (child, staff) in
            self.child = child
            self.staff = staff
        })
        Model.instance.eventChildAndStaff(childID: childID!, staffID: teacherID!)
    }
    
    func currentDate() -> String{
        return DateAdmin.currentDate()
    }
    
    
    func showDatePicker(timeStyle: DateFormatter.Style, dateStyle: DateFormatter.Style, callable:@escaping (String, String, Date) -> Void){
        DateAdmin.showDatePicker(timeStyle: timeStyle, dateStyle: dateStyle) { (dateString, time, date) in
            self.selectedDate = date
            self.selectedTime = time
            callable(dateString, time, date)
        }
    }
    
    func addConfirmButton(selector:Selector){
        let height = self.navigationController!.navigationBar.frame.height
        let frame = CGRect(x: 0, y: 0,width: height*0.8, height: height*0.8)
        let containView = UIView(frame: frame)
        let btn = UIButton(frame: frame)
        btn.setImage(UIImage(named: "checked"), for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        btn.addTarget(self, action: selector, for: .touchUpInside)
        containView.addSubview(btn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: containView)
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
