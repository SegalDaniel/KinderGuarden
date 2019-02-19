//
//  Water.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation
class Water{
    var waterID:String
    let amount:String
    let consumedAmount:String
    
    
    init(_waterID:String, _amount:String, _consumedAmount:String){
        self.waterID=_waterID
        self.amount=_amount
        self.consumedAmount=_consumedAmount
        
    }
    
    init(json:[String:Any]) {
        waterID = json["waterID"] as! String
        amount = json["amount"] as! String
        consumedAmount = json["consumedAmount"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["waterID"] = waterID
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }
    
}

