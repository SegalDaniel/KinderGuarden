//
//  Fever+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 17/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Fever)
public class Fever: NSManagedObject {
    convenience init(_childID:String, _tempreture:String){
        self.init(entity: Model.instance.feverEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(tempreture, forKey: "tempreture")
        
    }
    
   convenience init(json:[String:Any]) {
    self.init(entity: Model.instance.sleepEntity, insertInto: Model.instance.managedContext)
    self.setValue(json["childID"], forKey: "childID")
    self.setValue(json["tempreture"], forKey: "tempreture")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["tempreture"] = tempreture
        return json
        
    }

}
