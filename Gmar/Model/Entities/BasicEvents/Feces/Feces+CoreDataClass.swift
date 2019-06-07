//
//  Feces+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Feces)
public class Feces: BasicEvent {
    convenience init(color:String, texture:String, amount:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.fecesEntity, insertInto: Model.instance.managedContext)
        self.setValue(color, forKey: "color")
        self.setValue(texture, forKey: "texture")
        self.setValue(amount, forKey: "amount")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
        let id = String(eventDate.hashValue + Int(eventType))
        print(id)
        self.setValue(id, forKey: "eventID")
    }
    
    convenience  init(json:[String:Any]){
        self.init(entity: Model.instance.fecesEntity, insertInto: Model.instance.managedContext)
        BasicEvent.saveGlobals(event: self, json: json)
        self.setValue(Int16(Enums.BasicEvent.feces.rawValue), forKey: "eventType")
        self.setValue(json["color"] as! String, forKey: "color")
        self.setValue(json["texture"] as! String, forKey: "texture")
        self.setValue(json["amount"] as! String, forKey: "amount")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["color"] = color
        json["texture"] = texture
        json["amount"] = amount
        return json
    }
    
}
