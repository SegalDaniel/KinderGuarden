//
//  AuthorizedAccompanist+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(AuthorizedAccompanist)
public class AuthorizedAccompanist: NSManagedObject {
    convenience init(childID:String, name:String, phone:String, relation:String, eventDate:String){
        self.init(entity: Model.instance.authorizedAccompanistEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(name, forKey: "name")
        self.setValue(phone, forKey: "phone")
        self.setValue(relation, forKey: "relation")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.authorizedAccompanistEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["name"], forKey: "name")
        self.setValue(json["phone"], forKey: "phone")
        self.setValue(json["relation"], forKey: "relation")
        self.setValue(json["eventDate"], forKey: "eventDate")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["name"] = name
        json["phone"] = phone
        json["relation"] = relation
        json["eventDate"] = eventDate
        return json
        
    }
    
}
