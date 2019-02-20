//
//  Fever.swift
//  Gmar
//
//  Created by Daniel Segal on 19/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation
class Fever{
    var childID:String
    let tempreture:String
    
    
    init(_childID:String, _tempreture:String){
        self.childID=_childID
        self.tempreture=_tempreture
        
    }
    
    init(json:[String:Any]) {
        childID = json["childID"] as! String
        tempreture = json["tempreture"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["tempreture"] = tempreture
        return json
        
    }
    
}

