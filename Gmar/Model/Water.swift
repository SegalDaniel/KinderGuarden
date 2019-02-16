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
    var id:String
    let amount:String
    let consumedAmount:String
    
    
    init(_id:String, _amount:String, _consumedAmount:String){
        self.id=_id
        self.amount=_amount
        self.consumedAmount=_consumedAmount
        
    }
    
    init(json:[String:Any]) {
        id = json["id"] as! String
        amount = json["amount"] as! String
        consumedAmount = json["consumedAmount"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["id"] = id
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }
    
}

