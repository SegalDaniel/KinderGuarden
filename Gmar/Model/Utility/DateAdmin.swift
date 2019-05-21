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
    
    static func createTime(from:String) -> Date?{
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        var time = formatter.date(from: from)
        if time == nil{
            formatter.dateFormat = "HH:mm"
            time = formatter.date(from: from)
        }
        return time
    }
    
    static func extractDateAndTime(date:Date, dateStyle:DateFormatter.Style = .none, timeStyle:DateFormatter.Style = .short) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle

        return formatter.string(from: date)
    }
    
    static func morningDate(date:Date) -> Date{
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.hour = 6
        let dateAtMidnight = calendar.startOfDay(for: date)
        let morning = calendar.date(byAdding: components, to: dateAtMidnight)!
        return morning
    }
    
    static func eveningDate(date:Date) -> Date{
        let calendar = NSCalendar.current
        var components = DateComponents()
        components.day = 1
        let dateAtMidnight = calendar.startOfDay(for: date)
        let evening = calendar.date(byAdding: components, to: dateAtMidnight)!
        return evening
    }
    
    static func showDatePicker(timeStyle:DateFormatter.Style, dateStyle:DateFormatter.Style, callable:@escaping (String, String, Date) -> Void){
        RPicker.selectDate(title: "נא לבחור זמן מתאים", datePickerMode: .time, didSelectDate: { (selectedDate) in
            let formatter1 = DateFormatter()
            formatter1.dateStyle = .none
            formatter1.timeStyle = .short
            let time = formatter1.string(from: selectedDate)
            let formatter2 = DateFormatter()
            formatter2.timeStyle = timeStyle
            formatter2.dateStyle = dateStyle
            formatter2.locale = Locale(identifier: "he")
            let date = formatter2.string(from: selectedDate)
            callable(date, time, selectedDate)
        })
        
    }
}
