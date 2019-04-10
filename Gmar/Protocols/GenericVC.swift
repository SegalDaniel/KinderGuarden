//
//  GenericViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

class GenericVC: UIViewController {
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
}
