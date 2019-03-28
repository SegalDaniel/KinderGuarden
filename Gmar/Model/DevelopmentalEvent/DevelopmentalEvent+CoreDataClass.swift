//
//  DevelopmentalEvent+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 28/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(DevelopmentalEvent)
public class DevelopmentalEvent: NSManagedObject {
    convenience init(eventType:Int16, eventDate:String) {
        self.init(entity: Model.instance.basicEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.basicEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["eventType"], forKey: "eventType")
        self.setValue(json["eventDate"], forKey: "eventDate")
        
    }

}
