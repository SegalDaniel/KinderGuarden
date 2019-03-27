//
//  LiquidFood+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(LiquidFood)
public class LiquidFood: BasicEvent {
    convenience init(mealType:String, amount:String, consumedAmount:String){
        self.init(entity: Model.instance.liquidFoodEntity, insertInto: Model.instance.managedContext)
        self.setValue(mealType, forKey: "mealType")
        self.setValue(amount, forKey: "amount")
        self.setValue(consumedAmount, forKey: "consumedAmount")
        
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.liquidFoodEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["mealType"], forKey: "mealType")
        self.setValue(json["amount"], forKey: "amount")
        self.setValue(json["consumedAmount"], forKey: "consumedAmount")
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["mealType"] = mealType
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }
    
}
