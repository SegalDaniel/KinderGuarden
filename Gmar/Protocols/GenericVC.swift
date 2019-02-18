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
    
    func currentDate() -> String{
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        formatter.locale = Locale(identifier: "he")
        return formatter.string(from: currentDateTime)
    }
    
    
    func showDatePicker(callable:@escaping (String) -> Void){
        RPicker.selectDate(title: "נא לבחור זמן מתאים", datePickerMode: .time, didSelectDate: { (selectedDate) in
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .medium
            formatter.locale = Locale(identifier: "he")
            let time = formatter.string(from: selectedDate)
            callable(time)
        })

    }
}
