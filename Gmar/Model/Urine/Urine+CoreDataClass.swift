//
//  Urine+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Urine)
public class Urine: NSManagedObject {
    convenience init(childID:String, color:String, fragrance:String, amount:String){
        self.init(entity: Model.instance.UrineEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(color, forKey: "color")
        self.setValue(fragrance, forKey: "fragrance")
        self.setValue(amount, forKey: "amount")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.UrineEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["color"], forKey: "color")
        self.setValue(json["fragrance"], forKey: "fragrance")
        self.setValue(json["amount"], forKey: "amount")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["color"] = color
        json["fragrance"] = fragrance
        json["amount"] = amount
        return json
        
    }
    
    
}
