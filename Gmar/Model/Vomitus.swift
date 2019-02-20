//
//  Vomitus.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation
class Vomitus{
    var childID:String
    let proper:Bool

    
    init(_childID:String, _proper:Bool){
        self.childID=_childID
        self.proper=_proper
        
    }
    
    init(json:[String:Any]) {
        childID = json["childID"] as! String
        proper = json["proper"] as! Bool
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["proper"] = proper
        return json
        
    }
    
}
