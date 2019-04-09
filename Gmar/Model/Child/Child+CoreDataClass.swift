//
//  Child+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 03/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Child)
public class Child: NSManagedObject {
    convenience init(childID:String, firstName:String, gender:String, lastName:String, isPremature:Bool, birthDate:NSDate, isAttend:Bool, address:String, pickupHour:String) {
        self.init(entity: Model.instance.childEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(firstName, forKey: "firstName")
        self.setValue(lastName, forKey: "lastName")
        self.setValue(gender, forKey: "gender")
        self.setValue(isPremature, forKey: "isPremature")
        self.setValue(address, forKey: "address")
        self.setValue(pickupHour, forKey: "pickupHour")
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
        json["birthDate"] = birthDate
        json["isAttend"] = isAttend
        for authorize in self.authorized as! Set<AuthorizedAccompanist>{
        json["authorized"] = authorize.toJson()
        }
        for allergenic in self.allergenics as! Set<Allergenic>{
            json["allergenics"] = allergenic.toJson()
        }
        for chronicDisease in self.chronicDiseases as! Set<ChronicDisease>{
            json["chronicDiseases"] = chronicDisease.toJson()
        }
        for routine in self.routineMedication as! Set<AuthorizedAccompanist>{
            json["routineMedication"] = routine.toJson()
        }
        for food in self.foodList as! Set<Food>{
            json["foodList"] = food.toJson()
        }
        return json
    }
    

}
