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
        
        var authorizedJson:[String:Any] = [:]
        var i = 0
        authorized?.forEach({ (obj) in
            let obj = obj as! AuthorizedAccompanist
            authorizedJson["\(i)"] = obj.toJson()
            i += 1
        })
        json["authorized"] = authorizedJson
        
        var allergenicsJson:[String:Any] = [:]
        i = 0
        allergenics?.forEach({ (obj) in
            let obj = obj as! Allergenic
            allergenicsJson["\(i)"] = obj.toJson()
        })
        json["allergenics"] = allergenicsJson
        
        var chronicJson:[String:Any] = [:]
        i = 0
        chronicDiseases?.forEach({ (obj) in
            let obj = obj as! ChronicDisease
            chronicJson["\(i)"] = obj.toJson()
        })
        json["chronicDiseases"] = chronicJson
        
        var medicJson:[String:Any] = [:]
        i = 0
        routineMedication?.forEach({ (obj) in
            let obj = obj as! RoutineMedication
            medicJson["\(i)"] = obj.toJson()
        })
        json["routineMedication"] = medicJson
        
        var foodsJson:[String:Any] = [:]
        i = 0
        foodList?.forEach({ (obj) in
            let obj = obj as! Food
            foodsJson["\(i)"] = obj.toJson()
        })
        json["foodList"] = foodsJson
        
        var attJson:[String:Any] = [:]
        i = 0
        attendanceEvents?.forEach({ (obj) in
            let obj = obj as! Attendance
            attJson["\(i)"] = obj.toJson()
        })
        json["attendanceEvents"] = attJson
        
        var devJson:[String:Any] = [:]
        i = 0
        developmentalEvents?.forEach({ (obj) in
            let obj = obj as! DevelopmentalEvent
            devJson["\(i)"] = obj.toJson()
        })
        json["developmentalEvents"] = devJson
        return json
    }
    

}
