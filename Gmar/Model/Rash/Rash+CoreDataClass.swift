//
//  Rash+CoreDataClass.swift
//  
//
//  Created by Daniel Segal on 20/03/2019.
//
//

import Foundation
import CoreData

@objc(Rash)
public class Rash: NSManagedObject {
    convenience init(childID:String, type:String, area:String){
        self.init(entity: Model.instance.rashEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(type, forKey: "type")
        self.setValue(area, forKey: "area")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.rashEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["area"], forKey: "area")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["type"] = type
        json["area"] = area
        return json
        
    }
    
}
