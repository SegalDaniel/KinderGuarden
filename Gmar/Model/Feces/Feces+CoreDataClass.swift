//
//  Feces+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 19/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Feces)
public class Feces: NSManagedObject {
    convenience init(childID:String, color:String, texture:String, amount:String, eventDate:String){
        self.init(entity: Model.instance.fecesEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(color, forKey: "color")
        self.setValue(texture, forKey: "texture")
        self.setValue(amount, forKey: "amount")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.fecesEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["color"], forKey: "color")
        self.setValue(json["texture"], forKey: "texture")
        self.setValue(json["amount"], forKey: "amount")
        self.setValue(json["eventDate"], forKey: "eventDate")
        
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["color"] = color
        json["texture"] = texture
        json["amount"] = amount
        json["eventDate"] = eventDate
        return json
        
    }
    
}
