//
//  DevelopmentalEvent+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 28/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DevelopmentalEvent)
public class DevelopmentalEvent: NSManagedObject {
    convenience init(eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?) {
        self.init(entity: Model.instance.developmentEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.developmentEventEntity, insertInto: Model.instance.managedContext)
        Model.instance.getChild(childID: json["childID"] as! String) { (child) in
            Model.instance.getStaffByID(staffID: json["staffID"] as! String, callback: { (staff) in
                if let child = child{
                    if let staff = staff{
                        let dateString = json["eventDate"] as! String
                        let eventDate = DateAdmin.dateFromServer(date: dateString)
                        self.setValue(eventDate, forKey: "eventDate")
                        self.setValue(child, forKey: "child")
                        self.setValue(staff, forKey: "staff")
                        let id = json["eventID"] as! String
                        //                        let intID = Int(id)! % 1000
                        self.setValue(id, forKey: "eventID")
                    }
                }
            })
        }
    }
    
    func toJson() -> [String:Any]{
        var json = [String:Any]()
        json["eventType"] = eventType
        json["eventID"] = child?.childID.hashValue
        json["eventDate"] = eventDate
        json["childID"] = child?.childID
        json["staffID"] = staff?.staffID
        return json
        
    }
    
    static func ==(lhs:DevelopmentalEvent, rhs:[String:Any]) -> Bool{
        let id = rhs["eventID"] as! String
        let id2 = lhs.eventID
        let b = id2 == id
        return b
    }
    
}
