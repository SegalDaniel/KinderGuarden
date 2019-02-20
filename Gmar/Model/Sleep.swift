//
//  Sleep.swift
//  Gmar
//
//  Created by Daniel Segal on 19/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation
class Sleep{
    var childID:String
    let type:String
    let allocatedTime:String
    let sleepingScope:String
    
    
    init(_childID:String, _type:String, _allocatedTime:String, _sleepingScope:String){
        self.childID=_childID
        self.type=_type
        self.allocatedTime=_allocatedTime
        self.sleepingScope=_sleepingScope
        
    }
    
    init(json:[String:Any]) {
        childID = json["childID"] as! String
        type = json["type"] as! String
        allocatedTime = json["allocatedTime"] as! String
        sleepingScope = json["sleepingScope"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["type"] = type
        json["allocatedTime"] = allocatedTime
        json["sleepingScope"] = sleepingScope
        return json
        
    }
    
}

