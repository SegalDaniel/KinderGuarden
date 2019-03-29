//
//  Vomitus+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Vomitus)
public class Vomitus: BasicEvent {
    convenience  init(proper:Bool/*, eventDate:NSDate, eventType:Int16*/){
        self.init(entity: Model.instance.vomitusEntity, insertInto: Model.instance.managedContext)
        self.setValue(proper, forKey: "proper")
//        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.vomitusEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["proper"], forKey: "proper")
        
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["proper"] = proper
        return json
        
    }
    
}
