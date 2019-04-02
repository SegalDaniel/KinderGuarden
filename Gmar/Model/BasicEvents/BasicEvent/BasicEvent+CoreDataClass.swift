//
//  BasicEvent+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 28/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(BasicEvent)
public class BasicEvent: NSManagedObject {
    /*
    convenience init(eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?) {
        self.init(entity: Model.instance.basicEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.basicEventEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["eventType"], forKey: "eventType")
        self.setValue(json["eventDate"], forKey: "eventDate")
        self.setValue(json["child"], forKey: "child")
        self.setValue(json["staff"], forKey: "staff")
    }
    */
    func toJson() -> [String:Any]{ 
        var json = [String:Any]()
        json["eventType"] = eventType
        json["eventDate"] = eventDate
        json["childID"] = child?.childID
        json["staffID"] = staff?.staffID
        return json
        
    }

}
