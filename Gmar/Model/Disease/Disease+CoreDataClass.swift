//
//  Disease+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Disease)
public class Disease: NSManagedObject {
    convenience init(childID:String, type:String, details:String){
        self.init(entity: Model.instance.diseaseEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(type, forKey: "type")
        self.setValue(details, forKey: "details")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.diseaseEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["detalis"], forKey: "details")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["type"] = type
        json["details"] = details
        return json
        
    }

}
