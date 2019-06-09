//
//  Alert+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 31/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Alert)
public class Alert: NSManagedObject {
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.alertEntity, insertInto: Model.instance.managedContext)
        Model.instance.getChild(childID: json["childID"] as! String) { (child) in
            if let child = child{
                let date = json["alertDate"] as! String
                let d = DateAdmin.dateFromServer(date: date)
                self.setValue(d, forKey: "alertDate")
                self.setValue(Int16(truncating: json["type"] as! NSNumber), forKey: "type")
                self.setValue(Int16(truncating: json["level"] as! NSNumber), forKey: "level")
                //self.setValue(json["responsibleEvents"] as! String, forKey: "eventsLeading")
                self.setValue(json["actionNeeded"] as! String, forKey: "actionNeeded")
                self.setValue(json["alertID"] as! String, forKey: "alertID")
                self.child = child
                
            }
        }
    }
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["alertID"] = alertID
        json["alertDate"] = alertDate
        json["type"] = type
        json["level"] = level
        json["eventsLeading"] = eventsLeading
        json["childID"] = child?.childID
        json["actionNeeded"] = actionNeeded
        return json
    }
    
    static func ==(lhs:Alert, rhs:Alert) -> Bool{
        if rhs.alertID == nil || rhs.alertID == nil{
            return false
        }
        return rhs.alertID == lhs.alertID
    }
    
    static func ==(lhs:Alert, rhs:[String:Any]) -> Bool{
        let id = rhs["alertID"] as! String
        return lhs.alertID == id
    }
    
}
