//
//  Water+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 07/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Water)
public class Water: BasicEvent {
    convenience  init(amount:Int16?, consumedAmount:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.waterEntity, insertInto: Model.instance.managedContext)
        self.setValue(amount, forKey: "amount")
        self.setValue(consumedAmount, forKey: "consumedAmount")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.waterEntity, insertInto: Model.instance.managedContext)
        BasicEvent.saveGlobals(event: self, json: json)
        self.setValue(Int16(Enums.BasicEvent.water.rawValue), forKey: "eventType")
        let amount = json["amount"] as! String
//        self.setValue(json["amount"] as! Int, forKey: "amount")
        self.setValue(Int16(amount), forKey: "amount")
        self.setValue(json["consumedAmount"] as! String, forKey: "consumedAmount")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }

}
