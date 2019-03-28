//
//  SolidFood+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(SolidFood)
public class SolidFood: BasicEvent {
    convenience init(mealType:String, mealInMenu:String, amount:String, consumedAmount:String, eventDate:String){
        self.init(entity: Model.instance.solidFoodEntity, insertInto: Model.instance.managedContext)
        self.setValue(mealType, forKey: "mealType")
        self.setValue(mealInMenu, forKey: "mealInMenu")
        self.setValue(amount, forKey: "amount")
        self.setValue(consumedAmount, forKey: "consumedAmount")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.solidFoodEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["mealType"], forKey: "mealType")
        self.setValue(json["mealInMenu"], forKey: "mealInMenu")
        self.setValue(json["amount"], forKey: "amount")
        self.setValue(json["consumedAmount"], forKey: "consumedAmount")
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["mealType"] = mealType
        json["mealInMenu"] = mealInMenu
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }
    
}
