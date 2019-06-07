//
//  Urine+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Urine)
public class Urine: BasicEvent {
    convenience init(color:String, fragrance:String, amount:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.urineEntity, insertInto: Model.instance.managedContext)
        self.setValue(color, forKey: "color")
        self.setValue(fragrance, forKey: "fragrance")
        self.setValue(amount, forKey: "amount")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
        self.setValue(String(eventDate.hashValue + Int(eventType)), forKey: "eventID")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.urineEntity, insertInto: Model.instance.managedContext)
        BasicEvent.saveGlobals(event: self, json: json)
        self.setValue(Int16(Enums.BasicEvent.urine.rawValue), forKey: "eventType")
        self.setValue(json["color"] as! String, forKey: "color")
        self.setValue(json["amount"] as! String, forKey: "amount")
        self.setValue(json["fragrance"] as! String, forKey: "fragrance")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["color"] = color
        json["fragrance"] = fragrance
        json["amount"] = amount
        return json
        
    }
    
}
