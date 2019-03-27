//
//  Attendance+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 27/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Attendance)
public class Attendance: BasicEvent {
    convenience init(isLate:String, type:String){
        self.init(entity: Model.instance.authorizedAccompanistEntity, insertInto: Model.instance.managedContext)
        self.setValue(isLate, forKey: "isLate")
        self.setValue(type, forKey: "type")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.authorizedAccompanistEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["isLate"], forKey: "isLate")
        self.setValue(json["type"], forKey: "type")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["isLate"] = isLate
        json["type"] = type
        return json
        
    }

}
