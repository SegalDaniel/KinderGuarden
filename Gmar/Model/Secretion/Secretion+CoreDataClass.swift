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
    convenience init(type:String, area:String, rank:String){
        self.init(entity: Model.instance.secretionEntity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(area, forKey: "area")
        self.setValue(rank, forKey: "rank")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.secretionEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        self.setValue(json["area"], forKey: "area")
        self.setValue(json["rank"], forKey: "rank")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["type"] = type
        json["area"] = area
        json["rank"] = rank
        return json
        
    }
    
}
