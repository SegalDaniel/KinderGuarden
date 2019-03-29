//
//  Sleep+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Sleep)
public class Sleep: BasicEvent {
    convenience init(type:String, allocatedTime:String, sleepingScope:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.sleepEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(allocatedTime, forKey: "allocatedTime")
        self.setValue(sleepingScope, forKey: "sleepingScope")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.sleepEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["allocatedTime"], forKey: "allocatedTime")
        self.setValue(json["sleepingScope"], forKey: "sleepingScope")
        self.setValue(json["eventDate"], forKey: "eventDate")
        self.setValue(json["eventType"], forKey: "eventType")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["type"] = type
        json["allocatedTime"] = allocatedTime
        json["sleepingScope"] = sleepingScope
        return json
        
    }
    
}
