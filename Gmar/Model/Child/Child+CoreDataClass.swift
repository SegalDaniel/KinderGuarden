//
//  Child+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 01/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Child)
public class Child: NSManagedObject {
    convenience init(childID:String, firstName:String, gender:String, lastName:String, isPremature:Bool, birthDate:String, isAttend:Bool, address:String, pickupHour:String, foods:String, allergenic:String, diseases:String, medication:String) {
        self.init(entity: Model.instance.childEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(firstName, forKey: "firstName")
        self.setValue(lastName, forKey: "lastName")
        self.setValue(gender, forKey: "gender")
        self.setValue(isPremature, forKey: "isPremature")
        self.setValue(address, forKey: "address")
        self.setValue(pickupHour, forKey: "pickupHour")
        self.setValue(foods, forKey: "foods")
        self.setValue(allergenic, forKey: "allergenic")
        self.setValue(diseases, forKey: "diseases")
        self.setValue(medication, forKey: "medication")
        self.setValue(birthDate, forKey: "birthDate")
        self.setValue(isAttend, forKey: "isAttend")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.childEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["firstName"], forKey: "firstName")
        self.setValue(json["lastName"], forKey: "lastName")
        self.setValue(json["gender"], forKey: "gender")
        self.setValue(json["isPremature"], forKey: "isPremature")
        self.setValue(json["address"], forKey: "address")
        self.setValue(json["pickupHour"], forKey: "pickupHour")
        self.setValue(json["foods"], forKey: "foods")
        self.setValue(json["allergenic"], forKey: "allergenic")
        self.setValue(json["diseases"], forKey: "diseases")
        self.setValue(json["medication"], forKey: "medication")
        self.setValue(json["birthDate"], forKey: "birthDate")
        self.setValue(json["isAttend"], forKey: "isAttend")
    }
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["id"] = childID
        json["firstName"] = firstName
        json["lastName"] = lastName
        json["gender"] = gender
        json["isPremature"] = isPremature
        json["address"] = address
        json["pickupHour"] = pickupHour
        json["foods"] = foods
        json["allergenic"] = allergenic
        json["diseases"] = diseases
        json["medication"] = medication
        json["birthDate"] = birthDate
        json["isAttend"] = isAttend
        return json
    }

}
