//
//  Attendance+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 19/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Attendance)
public class Attendance: BasicEvent {
    convenience init(type:String, isLate:Bool, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?, authorized:AuthorizedAccompanist?){
        self.init(entity: Model.instance.attendanceEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(isLate, forKey: "isLate")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
        self.setValue(authorized, forKey: "authorized")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.attendanceEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"] as! Int, forKey: "type")
        self.setValue(json["isLate"] as! Bool, forKey: "isLate")
        self.setValue(json["sleepingScope"] as! String, forKey: "sleepingScope")
        self.setValue(json["eventDate"], forKey: "eventDate")
        eventType = 16
        let dateString = json["eventDate"] as! String
        DateAdmin.dateFromServer(date: dateString)
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["type"] = type
        json["isLate"] = isLate
        json["authorizedID"] = authorized?.authorizeId
        return json
    }
}
