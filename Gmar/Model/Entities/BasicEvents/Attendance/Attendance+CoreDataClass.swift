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
        BasicEvent.saveGlobals(event: self, json: json)
        self.setValue(Int16(Enums.BasicEvent.attandance.rawValue), forKey: "eventType")
        self.setValue(json["isLate"] as! Bool, forKey: "isLate")
        self.setValue(json["type"] as! String, forKey: "type")
        Model.instance.getAuthorizedByID(authID: json["authorized"] as! String) { (auth) in
            if let auth = auth{
                self.setValue(auth, forKey: "authorized")
            }
        }
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["type"] = type
        json["isLate"] = isLate
        json["authorizedID"] = authorized?.authorizeId
        return json
    }
    
}
