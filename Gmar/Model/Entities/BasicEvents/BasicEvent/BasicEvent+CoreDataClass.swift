//
//  BasicEvent+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 28/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.

import Foundation
import CoreData

@objc(BasicEvent)
public class BasicEvent: NSManagedObject {
    
    func toJson() -> [String:Any]{
        var json = [String:Any]()
        json["eventType"] = eventType
        json["eventID"] = eventDate.hashValue
        json["eventDate"] = eventDate
        json["level"] = level
        json["childID"] = child?.childID
        json["staffID"] = staff?.staffID
        return json
    }
    
    static func saveGlobals(event:BasicEvent, json:[String:Any]){
        Model.instance.getChild(childID: json["childID"] as! String) { (child) in
            Model.instance.getStaffByID(staffID: json["staffID"] as! String, callback: { (staff) in
                if let child = child{
                    if let staff = staff{
                        let dateString = json["eventDate"] as! String
                        let eventDate = DateAdmin.dateFromServer(date: dateString)
                        event.setValue(eventDate, forKey: "eventDate")
                        event.setValue(child, forKey: "child")
                        event.setValue(staff, forKey: "staff")
                        //level is missing in Server!
                        //event.setValue(Int16(truncating: json["level"] as! NSNumber), forKey: "level")
                        event.setValue(Int16(json["eventID"] as! String), forKey: "eventID")
                    }
                }
            })
        }
    }
}
