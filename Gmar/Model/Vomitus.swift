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
    var id:String
    let proper:Bool

    
    init(_id:String, _proper:Bool){
        self.id=_id
        self.proper=_proper
        
    }
    
    init(json:[String:Any]) {
        id = json["id"] as! String
        proper = json["proper"] as! Bool
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["id"] = id
        json["proper"] = proper
        return json
        
    }
    
}
