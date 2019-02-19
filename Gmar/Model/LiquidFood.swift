//
//  LiquidFood.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//


import UIKit
import Foundation
class LiquidFood{
    var liquidFoodID:String
    let mealType : String
    let amount:String
    let consumedAmount:String

    
    init(_liquidFoodID:String, _mealType:String, _amount:String, _consumedAmount:String){
        self.liquidFoodID=_liquidFoodID
        self.mealType=_mealType
        self.amount=_amount
        self.consumedAmount=_consumedAmount

    }
    
    init(json:[String:Any]) {
        liquidFoodID = json["liquidFoodID"] as! String
        mealType = json["mealType"] as! String
        amount = json["amount"] as! String
        consumedAmount = json["consumedAmount"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["liquidFoodID"] = liquidFoodID
        json["mealType"] = mealType
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }
    
}

