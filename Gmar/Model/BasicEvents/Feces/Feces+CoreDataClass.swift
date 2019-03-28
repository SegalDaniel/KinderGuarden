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
    convenience init(color:String, texture:String, amount:String/*, eventDate:NSDate, eventType:Int16*/){
        self.init(entity: Model.instance.fecesEntity, insertInto: Model.instance.managedContext)
        self.setValue(color, forKey: "color")
        self.setValue(texture, forKey: "texture")
        self.setValue(amount, forKey: "amount")
//        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.fecesEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["color"], forKey: "color")
        self.setValue(json["texture"], forKey: "texture")
        self.setValue(json["amount"], forKey: "amount")
        
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["color"] = color
        json["texture"] = texture
        json["amount"] = amount
        return json
        
    }
    
}
