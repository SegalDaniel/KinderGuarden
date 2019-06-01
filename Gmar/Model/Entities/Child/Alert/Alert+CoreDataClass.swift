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
    convenience init(alertDate:NSDate, level:Int16, eventsLeading:String, child:Child?, actionNeeded:String){
        self.init(entity: Model.instance.alertEntity, insertInto: Model.instance.managedContext)
        self.setValue(alertDate, forKey: "alertDate")
        self.setValue(level, forKey: "level")
        self.setValue(eventsLeading, forKey: "eventsLeading")
        self.setValue(actionNeeded, forKey: "actionNeeded")
        self.setValue(child, forKey: "child")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.alertEntity, insertInto: Model.instance.managedContext)
        Model.instance.getChild(childID: json["childID"] as! String) { (child) in
            if let child = child{
            let date = json["alertDate"] as! String
            let d = DateAdmin.dateFromServer(date: date)
            self.setValue(d, forKey: "alertDate")
            self.setValue(Int16(truncating: json["type"] as! NSNumber), forKey: "type")
            self.setValue(Int16(truncating: json["level"] as! NSNumber), forKey: "level")
            self.setValue(json["responsibleEvents"] as! String, forKey: "eventsLeading")
            self.setValue(json["actionNeeded"] as! String, forKey: "actionNeeded")
            self.child = child
            }
        }
    }
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["alertDate"] = alertDate
        json["type"] = type
        json["level"] = level
        json["eventsLeading"] = eventsLeading
        json["childID"] = child?.childID
        json["actionNeeded"] = actionNeeded
        return json
    }
    
    static func ==(lhs:Alert, rhs:Alert) -> Bool{
        if lhs.child?.childID == rhs.child?.childID && lhs.alertDate == rhs.alertDate && lhs.actionNeeded == rhs.actionNeeded{
            return true
        }
        return false
    }

}
