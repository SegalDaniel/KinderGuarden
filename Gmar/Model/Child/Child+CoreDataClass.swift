//
//  Child+CoreDataClass.swift
//  Gmar
//
//  Created by Zach Bachar on 16/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Child)
public class Child: NSManagedObject {
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.childEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["name"], forKey: "name")
        self.setValue(json["lastName"], forKey: "lastName")
        self.setValue(json["gender"], forKey: "gender")
        self.setValue(json["age"], forKey: "age")
        self.setValue(json["birthDate"], forKey: "birthDate")
        self.setValue(json["image"], forKey: "image")
    }
    
    convenience init(childID:String, name:String, gender:String, lastName:String, age:String, birthDate:String, image:String?) {
        self.init(entity: Model.instance.childEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(name, forKey: "name")
        self.setValue(lastName, forKey: "lastName")
        self.setValue(gender, forKey: "gender")
        self.setValue(age, forKey: "age")
        self.setValue(birthDate, forKey: "birthDate")
        self.setValue(image, forKey: "image")
    }
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["id"] = childID
        json["name"] = name
        json["lastName"] = lastName
        json["gender"] = gender
        json["age"] = age
        json["birthDate"] = birthDate
        json["image"] = image
        return json
    }
}
