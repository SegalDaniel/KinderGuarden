//
//  Staff+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 28/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Staff)
public class Staff: NSManagedObject {
    convenience init(staffID:String, firstName:String, lastName:String, image:String?){
        self.init(entity: Model.instance.staffEntity, insertInto: Model.instance.managedContext)
        self.setValue(staffID, forKey: "staffID")
        self.setValue(firstName, forKey: "firstName")
        self.setValue(lastName, forKey: "lastName")
        self.setValue(image, forKey: "image")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.staffEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["staffID"], forKey: "staffID")
        self.setValue(json["firstName"], forKey: "firstName")
        self.setValue(json["lastName"], forKey: "lastName")
        self.setValue(json["image"], forKey: "image")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["staffID"] = staffID
        json["firstName"] = firstName
        json["lastName"] = lastName
        json["image"] = image
        var i = 0
//        var attJson:[String:Any] = [:]
//        i = 0
//        attendanceEvents?.forEach({ (obj) in
//            let obj = obj as! Attendance
//            attJson["\(i)"] = obj.toJson()
//        })
//        json["attendanceEvents"] = attJson
        
        var basJson:[String:Any] = [:]
        i = 0
        basicEvents?.forEach({ (obj) in
            let obj = obj as! BasicEvent
            basJson["\(i)"] = obj.toJson()
        })
        json["basicEvents"] = basJson
        
        var devJson:[String:Any] = [:]
        i = 0
        developmentalEvents?.forEach({ (obj) in
            let obj = obj as! DevelopmentalEvent
            devJson["\(i)"] = obj.toJson()
        })
        json["developmentalEvents"] = devJson
        return json
    }
    
}
