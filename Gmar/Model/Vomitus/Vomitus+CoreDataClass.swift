//
//  Vomitus+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Vomitus)
public class Vomitus: NSManagedObject {
    convenience  init(childID:String, proper:Bool){
        self.init(entity: Model.instance.VomitusEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(proper, forKey: "proper")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.VomitusEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["proper"], forKey: "proper")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["proper"] = proper
        return json
        
    }
    
    
}
