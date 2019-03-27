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
    convenience init(type:String, allocatedTime:String, sleepingScope:String){
        self.init(entity: Model.instance.sleepEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(allocatedTime, forKey: "allocatedTime")
        self.setValue(sleepingScope, forKey: "sleepingScope")
        
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.sleepEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["allocatedTime"], forKey: "allocatedTime")
        self.setValue(json["sleepingScope"], forKey: "sleepingScope")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["type"] = type
        json["allocatedTime"] = allocatedTime
        json["sleepingScope"] = sleepingScope
        return json
        
    }
    
}
