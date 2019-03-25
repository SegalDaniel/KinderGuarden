//
//  BasicEvent+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 25/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(BasicEvent)
public class BasicEvent: NSManagedObject {
    convenience init(type:String) {
        self.init(entity: Model.instance.basicEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.basicEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        
    }

}
