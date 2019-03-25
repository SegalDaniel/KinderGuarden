//
//  Fever+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 25/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Fever)
public class Fever: BasicEvent {
    convenience init(_childID:String, _tempreture:String, eventDate:String){
        self.init(entity: Model.instance.feverEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(tempreture, forKey: "tempreture")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.feverEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["tempreture"], forKey: "tempreture")
        self.setValue(json["eventDate"], forKey: "eventDate")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["tempreture"] = tempreture
        json["eventDate"] = eventDate
        return json
        
    }
    
}
