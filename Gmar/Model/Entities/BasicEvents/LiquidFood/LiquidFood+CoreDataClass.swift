//
//  LiquidFood+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 07/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(LiquidFood)
public class LiquidFood: BasicEvent {
    convenience init(mealType:String, amount:Int16?, consumedAmount:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.liquidFoodEntity, insertInto: Model.instance.managedContext)
        self.setValue(mealType, forKey: "mealType")
        self.setValue(amount, forKey: "amount")
        self.setValue(consumedAmount, forKey: "consumedAmount")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.liquidFoodEntity, insertInto: Model.instance.managedContext)
        BasicEvent.saveGlobals(event: self, json: json)
        self.setValue(Int16(Enums.BasicEvent.tamal.rawValue), forKey: "eventType")
        self.setValue(json["amount"] as! Int16, forKey: "amount")
        self.setValue(json["consumedAmount"] as! String, forKey: "consumedAmount")
        self.setValue(json["mealType"] as! String, forKey: "mealType")
        self.setValue(json["mealInMenu"] as! String, forKey: "mealInMenu")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["mealType"] = mealType
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }

}
