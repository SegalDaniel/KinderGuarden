//
//  Cough+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Cough)
public class Cough: BasicEvent {
    convenience init(type:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.coughEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.coughEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["eventType"], forKey: "eventType")
        self.setValue(json["eventDate"], forKey: "eventDate")
        self.setValue(json["child"], forKey: "child")
        self.setValue(json["staff"], forKey: "staff")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["type"] = type
        return json
        
    }
    
}
