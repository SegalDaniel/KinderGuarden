//
//  Urine+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 25/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Urine)
public class Urine: BasicEvent {
    convenience init(childID:String, color:String, fragrance:String, amount:String, eventDate:String){
        self.init(entity: Model.instance.urineEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(color, forKey: "color")
        self.setValue(fragrance, forKey: "fragrance")
        self.setValue(amount, forKey: "amount")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.urineEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["color"], forKey: "color")
        self.setValue(json["fragrance"], forKey: "fragrance")
        self.setValue(json["amount"], forKey: "amount")
        self.setValue(json["eventDate"], forKey: "eventDate")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["color"] = color
        json["fragrance"] = fragrance
        json["amount"] = amount
        json["eventDate"] = eventDate
        return json
        
    }
    
}
