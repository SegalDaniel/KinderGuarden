//
//  Feces.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation
class Feces{
    var id:String
    let color:String
    let texture:String
    let amount:String
    
    
    init(_id:String, _color:String, _texture:String, _amount:String){
        self.id=_id
        self.color=_color
        self.texture=_texture
        self.amount=_amount
        
    }
    
    init(json:[String:Any]) {
        id = json["id"] as! String
        color = json["color"] as! String
        texture = json["texture"] as! String
        amount = json["amount"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["id"] = id
        json["color"] = color
        json["texture"] = texture
        json["amount"] = amount
        return json
        
    }
    
}
