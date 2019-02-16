//
//  Staff.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation
class Staff{
    var id:String
    let name : String
    let gender:String
    let birthDate:String
    let age:String
    var image:String
    
    
    
    init(_id:String, _name:String,  _gender:String, _birthDate:String, _age:String, _image:String){
        self.id=_id
        self.name=_name
        self.gender=_gender
        self.birthDate=_birthDate
        self.age=_age
        self.image=_image
    }
    
    init(json:[String:Any]) {
        id = json["id"] as! String
        name = json["name"] as! String
        gender = json["gender"] as! String
        age = json["age"] as! String
        birthDate = json["birthDate"] as! String
        image = json["image"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["id"] = id
        json["name"] = name
        json["gender"] = gender
        json["age"] = age
        json["birthDate"] = birthDate
        json["image"] = image
        return json
    }
    
}
