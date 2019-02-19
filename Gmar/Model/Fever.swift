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
    var feverID:String
    let tempreture:String
    
    
    init(_feverID:String, _tempreture:String){
        self.feverID=_feverID
        self.tempreture=_tempreture
        
    }
    
    init(json:[String:Any]) {
        feverID = json["feverID"] as! String
        tempreture = json["tempreture"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["feverID"] = feverID
        json["tempreture"] = tempreture
        return json
        
    }
    
}

