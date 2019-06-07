//
//  SolidFood+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 07/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(SolidFood)
public class SolidFood: BasicEvent {
    convenience init(mealType:String, mealInMenu:String?, amount:Int16?, consumedAmount:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.solidFoodEntity, insertInto: Model.instance.managedContext)
        self.setValue(mealType, forKey: "mealType")
        self.setValue(mealInMenu, forKey: "mealInMenu")
        self.setValue(amount, forKey: "amount")
        self.setValue(consumedAmount, forKey: "consumedAmount")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
        self.setValue(String(eventDate.hashValue + Int(eventType)), forKey: "eventID")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.solidFoodEntity, insertInto: Model.instance.managedContext)
        BasicEvent.saveGlobals(event: self, json: json)
        self.setValue(Int16(Enums.BasicEvent.solidFoods.rawValue), forKey: "eventType")
        let amount = json["amount"] as! String
        self.setValue(Int16(amount), forKey: "amount")
        self.setValue(json["consumedAmount"] as! String, forKey: "consumedAmount")
        self.setValue(json["mealType"] as! String, forKey: "mealType")
        self.setValue(" ", forKey: "mealInMenu")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["mealType"] = mealType
        json["mealInMenu"] = "mealInMenu"
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }

}
