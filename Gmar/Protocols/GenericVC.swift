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
        return DateAdmin.currentDate()
    }
    
    
    func showDatePicker(timeStyle: DateFormatter.Style, dateStyle: DateFormatter.Style, callable:@escaping (String) -> Void){
        DateAdmin.showDatePicker(timeStyle: timeStyle, dateStyle: dateStyle, callable: callable)
    }
}
