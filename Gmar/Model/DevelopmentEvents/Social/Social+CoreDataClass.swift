//
//  Social+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 04/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Social)
public class Social: DevelopmentalEvent {
    convenience init(type:String, month:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.socialEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(staff, forKey: "month")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.socialEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["month"], forKey: "month")
        self.setValue(json["eventType"], forKey: "eventType")
        self.setValue(json["eventDate"], forKey: "eventDate")
        self.setValue(json["child"], forKey: "child")
        self.setValue(json["staff"], forKey: "staff")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["type"] = type
        json["month"] = month
        return json
        
    }

}
