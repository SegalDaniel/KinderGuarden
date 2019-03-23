//
//  Attendance+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Attendance)
public class Attendance: NSManagedObject {
    convenience init(childID:String, type:String, isLate:Bool){
        self.init(entity: Model.instance.attendanceEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(type, forKey: "type")
        self.setValue(isLate, forKey: "isLate")
        
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.attendanceEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["isLate"], forKey: "isLate")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["type"] = type
        json["isLate"] = isLate
        return json
        
    }
    
}
