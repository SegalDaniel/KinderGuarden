//
//  Water+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Water)
public class Water: BasicEvent {
    convenience  init(amount:String, consumedAmount:String, eventDate:String){
        self.init(entity: Model.instance.waterEntity, insertInto: Model.instance.managedContext)
        self.setValue(amount, forKey: "amount")
        self.setValue(consumedAmount, forKey: "consumedAmount")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.waterEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["amount"], forKey: "amount")
        self.setValue(json["consumedAmount"], forKey: "consumedAmount")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["amount"] = amount
        json["consumedAmount"] = consumedAmount
        return json
        
    }
    
}
