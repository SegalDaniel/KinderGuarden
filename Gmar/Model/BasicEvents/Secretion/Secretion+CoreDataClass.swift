//
//  Secretion+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Secretion)
public class Secretion: BasicEvent {
    convenience init(type:String, area:String, rank:String/*, eventDate:NSDate, eventType:Int16*/){
        self.init(entity: Model.instance.secretionEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(area, forKey: "area")
        self.setValue(rank, forKey: "rank")
//        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.secretionEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["area"], forKey: "area")
        self.setValue(json["rank"], forKey: "rank")
        
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["type"] = type
        json["area"] = area
        json["rank"] = rank
        return json
        
    }
    
}
