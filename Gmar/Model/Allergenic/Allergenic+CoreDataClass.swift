//
//  Allergenic+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 02/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Allergenic)
public class Allergenic: NSManagedObject {
    convenience init(type:String, child:Child?){
        self.init(entity: Model.instance.allergenicEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(child, forKey: "child")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.allergenicEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        
    }
    
    func toJson() -> [String:Any]{
        var json = [String:Any]()
        json["type"] = type
        json["child"] = child?.toJson()
        return json
        
    }
    
}
