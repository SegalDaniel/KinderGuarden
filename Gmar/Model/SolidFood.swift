//
//  SolidFood.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation
class SolidFood{
    var solidFoodID:String
    let mealType:String //morning etc
    let mealInMenu:String
    let amount:String
    let consumedAmount:String
    
    
    init(_solidFoodID:String, _mealType:String, _mealInMenu:String, _amount:String, _consumedAmount:String){
        self.solidFoodID=_solidFoodID
        self.mealType=_mealType
        self.mealInMenu=_mealInMenu
        self.amount=_amount
        self.consumedAmount=_consumedAmount
        
    }
    
    init(json:[String:Any]) {
        solidFoodID = json["solidFoodID"] as! String
        mealType = json["mealType"] as! String
        mealInMenu = json["mealInMenu"] as! String
        amount = json["amount"] as! String
        consumedAmount = json["consumedAmount"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["solidFoodID"] = solidFoodID
        json["mealType"] = mealType
        json["mealInMenu"] = mealInMenu
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }
    
}
