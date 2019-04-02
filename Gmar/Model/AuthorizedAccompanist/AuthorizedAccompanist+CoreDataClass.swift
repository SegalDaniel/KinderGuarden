//
//  AuthorizedAccompanist+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 27/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(AuthorizedAccompanist)
public class AuthorizedAccompanist: NSManagedObject {
    convenience init(name:String, phone:String, relation:String){
        self.init(entity: Model.instance.authorizedAccompanistEntity, insertInto: Model.instance.managedContext)
        self.setValue(name, forKey: "name")
        self.setValue(phone, forKey: "phone")
        self.setValue(relation, forKey: "relation")
        self.setValue(child, forKey: "child")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.authorizedAccompanistEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["name"], forKey: "name")
        self.setValue(json["phone"], forKey: "phone")
        self.setValue(json["relation"], forKey: "relation")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["name"] = name
        json["phone"] = phone
        json["relation"] = relation
        json["childID"] = child?.childID
        return json
        
    }
    
}
