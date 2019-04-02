//
//  Attendance+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 28/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Attendance)
public class Attendance: NSManagedObject {
    convenience init(isLate:String, type:String, eventDate:String, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.authorizedAccompanistEntity, insertInto: Model.instance.managedContext)
        self.setValue(isLate, forKey: "isLate")
        self.setValue(type, forKey: "type")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(child, forKey: "staff")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.authorizedAccompanistEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["isLate"], forKey: "isLate")
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["eventDate"], forKey: "eventDate")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["isLate"] = isLate
        json["type"] = type
        json["eventDate"] = eventDate
        json["childID"] = child?.childID
        return json
        
    }

}
