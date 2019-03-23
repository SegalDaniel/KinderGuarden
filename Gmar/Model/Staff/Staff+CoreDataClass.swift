//
//  Staff+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 17/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Staff)
public class Staff: NSManagedObject {
    convenience init(staffID:String, name:String, birthdate:String, image:String){
        self.init(entity: Model.instance.staffEntity, insertInto: Model.instance.managedContext)
        self.setValue(staffID, forKey: "staffID")
        self.setValue(name, forKey: "name")
        self.setValue(birthdate, forKey: "birthdate")
        self.setValue(image, forKey: "image")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.staffEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["staffID"], forKey: "staffID")
        self.setValue(json["name"], forKey: "name")
        self.setValue(json["birthdate"], forKey: "birthdate")
        self.setValue(json["image"], forKey: "image")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["staffID"] = staffID
        json["name"] = name
        json["birthdate"] = birthdate
        json["image"] = image
        return json
    }
    
}

