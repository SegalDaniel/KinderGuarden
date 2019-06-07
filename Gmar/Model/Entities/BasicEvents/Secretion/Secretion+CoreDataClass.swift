//
//  Secretion+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Secretion)
public class Secretion: BasicEvent {
    convenience init(type:String, area:String, rank:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.secretionEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(area, forKey: "area")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
        self.setValue(String(eventDate.hashValue + Int(eventType)), forKey: "eventID")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.secretionEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"] as! String, forKey: "type")
        self.setValue(json["area"] as! String, forKey: "area")
    }
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["type"] = type
        json["area"] = area
        return json
    }
}
