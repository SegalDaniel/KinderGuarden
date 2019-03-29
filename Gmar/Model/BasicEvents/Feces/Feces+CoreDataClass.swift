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
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.fecesEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["color"], forKey: "color")
        self.setValue(json["texture"], forKey: "texture")
        self.setValue(json["amount"], forKey: "amount")
        self.setValue(json["eventType"], forKey: "eventType")
        self.setValue(json["eventDate"], forKey: "eventDate")
        self.setValue(json["child"], forKey: "child")
        self.setValue(json["staff"], forKey: "staff")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["color"] = color
        json["texture"] = texture
        json["amount"] = amount
        return json
        
    }
    
}
