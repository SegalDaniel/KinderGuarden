//
//  DateAdmin.swift
//  Gmar
//
//  Created by Zach Bachar on 20/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation

class DateAdmin{
    
    static func currentDateEN(timeStyle:DateFormatter.Style = .medium, dateStyle:DateFormatter.Style = .short) -> String{
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = timeStyle
        formatter.dateStyle = dateStyle
        return formatter.string(from: currentDateTime)
    }
    
    static func currentDate(timeStyle:DateFormatter.Style = .medium, dateStyle:DateFormatter.Style = .medium) -> String{
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = timeStyle
        formatter.dateStyle = dateStyle
        formatter.locale = Locale(identifier: "he")
        return formatter.string(from: currentDateTime)
    }
    
    static func currentTime(timeStyle:DateFormatter.Style = .medium) -> String{
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = timeStyle
        formatter.dateStyle = .none
        formatter.locale = Locale(identifier: "he")
        return formatter.string(from: currentDateTime)
    }
    
    static func showDatePicker(timeStyle:DateFormatter.Style, dateStyle:DateFormatter.Style, callable:@escaping (String) -> Void){
        RPicker.selectDate(title: "נא לבחור זמן מתאים", datePickerMode: .time, didSelectDate: { (selectedDate) in
            let formatter = DateFormatter()
            formatter.timeStyle = timeStyle
            formatter.dateStyle = dateStyle
            formatter.locale = Locale(identifier: "he")
            let time = formatter.string(from: selectedDate)
            callable(time)
        })
        
    }
}
