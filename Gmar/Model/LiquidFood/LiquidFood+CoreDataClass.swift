//
//  LiquidFood+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 17/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(LiquidFood)
public class LiquidFood: NSManagedObject {
    convenience init(childID:String, mealType:String, amount:String, consumedAmount:String, eventDate:String){
        self.init(entity: Model.instance.liquidFoodEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(mealType, forKey: "mealType")
        self.setValue(amount, forKey: "amount")
        self.setValue(consumedAmount, forKey: "consumedAmount")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.liquidFoodEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["mealType"], forKey: "mealType")
        self.setValue(json["amount"], forKey: "amount")
        self.setValue(json["consumedAmount"], forKey: "consumedAmount")
        self.setValue(json["eventDate"], forKey: "eventDate")
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["mealType"] = mealType
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        json["eventDate"] = eventDate
        return json
        
    }
    
}
