//
//  Food+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 05/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Food)
public class Food: NSManagedObject {
    
    convenience init(type:String, details:String, child:Child?){
        self.init(entity: Model.instance.foodEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(type, forKey: "details")
        self.setValue(child, forKey: "child")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.foodEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["details"], forKey: "details")
        
    }
    
    func toJson() -> [String:Any]{
        var json = [String:Any]()
        json["type"] = type
        json["detalis"] = details
        json["childID"] = child?.childID
        return json
        
    }

}
