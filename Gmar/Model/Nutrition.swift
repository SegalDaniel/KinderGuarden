//
//  Feeding&Drinking.swift
//  Gmar
//
//  Created by Daniel Segal on 19/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation
class Nutrition{
    var nutritionID:String//change every id to child id
    let liquidFoodID:String
    let solidFoodID:String
    let waterID:String
    //טבלת ילדים טבלת סייעות והגננת ובטלה לכל סוג אירוע בסיסי
    
    
    init(_nutritionID:String, _liquidFoodID:String, _solidFoodID:String, _waterID:String){
        self.nutritionID=_nutritionID
        self.liquidFoodID=_liquidFoodID
        self.solidFoodID=_solidFoodID
        self.waterID=_waterID
        
    }
    
    init(json:[String:Any]) {
        nutritionID = json["nutritionID"] as! String
        liquidFoodID = json["liquidFoodID"] as! String
        solidFoodID = json["solidFoodID"] as! String
        waterID = json["waterID"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["nutritionID"] = nutritionID
        json["liquidFoodID"] = liquidFoodID
        json["solidFoodID"] = solidFoodID
        json["waterID"] = waterID
        return json
        
    }
    
}

