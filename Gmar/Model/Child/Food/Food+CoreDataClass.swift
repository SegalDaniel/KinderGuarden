//
//  Food+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 04/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Food)
public class Food: NSManagedObject {
    convenience init(type:String, detalis:String, child:Child?){
        self.init(entity: Model.instance.foodEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(type, forKey: "detalis")
        self.setValue(child, forKey: "child")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.foodEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["detalis"], forKey: "detalis")
        
    }
    
    func toJson() -> [String:Any]{
        var json = [String:Any]()
        json["type"] = type
        json["detalis"] = detalis
        json["childID"] = child?.childID
        return json
        
    }

}
