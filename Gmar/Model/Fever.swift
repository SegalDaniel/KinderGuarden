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
    var id:String
    let tempreture:String
    
    
    init(_id:String, _tempreture:String){
        self.id=_id
        self.tempreture=_tempreture
        
    }
    
    init(json:[String:Any]) {
        id = json["id"] as! String
        tempreture = json["tempreture"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["id"] = id
        json["tempreture"] = tempreture
        return json
        
    }
    
}

