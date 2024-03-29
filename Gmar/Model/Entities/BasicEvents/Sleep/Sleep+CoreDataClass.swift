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
        self.setValue(String(eventDate.hashValue + Int(eventType)), forKey: "eventID")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.sleepEntity, insertInto: Model.instance.managedContext)
        BasicEvent.saveGlobals(event: self, json: json)
        self.setValue(Int16(Enums.BasicEvent.sleep.rawValue), forKey: "eventType")
        self.setValue(json["type"] as! String, forKey: "type")
        self.setValue(json["allocatedTime"] as! String, forKey: "allocatedTime")
        self.setValue(json["sleepingScope"] as! String, forKey: "sleepingScope")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["type"] = type
        json["allocatedTime"] = allocatedTime
        json["sleepingScope"] = sleepingScope
        return json
        
    }
    
}
