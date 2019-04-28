//
//  Alert+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 25/04/2019.
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
        self.setValue(json["alertDate"], forKey: "alertDate")
        self.setValue(json["level"], forKey: "level")
        self.setValue(json["eventsLeading"], forKey: "eventsLeading")
        self.setValue(json["actionNeeded"], forKey: "actionNeeded")
    }
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["alertDate"] = alertDate
        json["level"] = level
        json["eventsLeading"] = eventsLeading
        json["childID"] = child?.childID
        json["actionNeeded"] = actionNeeded
        return json
    }
    
}
