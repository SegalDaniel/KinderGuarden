//
//  Cough+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Cough)
public class Cough: BasicEvent {
    convenience init(type:String){
        self.init(entity: Model.instance.coughEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.coughEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["type"] = type
        return json
        
    }
    
}
