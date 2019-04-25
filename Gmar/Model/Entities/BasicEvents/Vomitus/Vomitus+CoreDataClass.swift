////
//  Vomitus+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Vomitus)
public class Vomitus: BasicEvent {
    convenience  init(type:String, proper:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.vomitusEntity, insertInto: Model.instance.managedContext)
        self.setValue(proper, forKey: "proper")
        self.setValue(type, forKey: "type")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.vomitusEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["proper"], forKey: "proper")
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["eventType"], forKey: "eventType")
        self.setValue(json["eventDate"], forKey: "eventDate")
        self.setValue(json["child"], forKey: "child")
        self.setValue(json["staff"], forKey: "staff")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["proper"] = proper
        json["type"] = type
        return json
        
    }
    
}

