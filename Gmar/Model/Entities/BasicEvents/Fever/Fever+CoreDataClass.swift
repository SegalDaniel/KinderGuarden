//
//  Fever+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Fever)
public class Fever: BasicEvent {
    convenience init(tempreture:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.feverEntity, insertInto: Model.instance.managedContext)
        self.setValue(tempreture, forKey: "tempreture")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
        self.setValue(String(eventDate.hashValue + Int(eventType)), forKey: "eventID")
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.feverEntity, insertInto: Model.instance.managedContext)
        BasicEvent.saveGlobals(event: self, json: json)
        self.setValue(Int16(Enums.BasicEvent.feever.rawValue), forKey: "eventType")
        self.setValue(json["tempreture"] as! String, forKey: "tempreture")
        
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["tempreture"] = tempreture
        return json
        
    }
    
}
