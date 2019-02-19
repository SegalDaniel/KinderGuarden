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
    var vomitusID:String
    let proper:Bool

    
    init(_vomitusID:String, _proper:Bool){
        self.vomitusID=_vomitusID
        self.proper=_proper
        
    }
    
    init(json:[String:Any]) {
        vomitusID = json["vomitusID"] as! String
        proper = json["proper"] as! Bool
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["vomitusID"] = vomitusID
        json["proper"] = proper
        return json
        
    }
    
}
