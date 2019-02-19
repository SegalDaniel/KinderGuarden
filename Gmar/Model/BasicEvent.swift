//
//  Event.swift
//  Gmar
//
//  Created by Daniel Segal on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//


import UIKit
import Foundation
class BasicEvent{
    var basicEventID:String
    var nutritionID:String
    var fecesID : String
    var urineID:String
    var vomitusID:String
    var feverID:String
    var sleepID:String
    //need to add gemeral behavior
    
    
    init(_basicEventID:String, _nutritionID:String, _fecesID:String, _urineID:String, _vomitusID:String, _feverID:String, _sleepID:String){
        self.basicEventID=_basicEventID
        self.nutritionID=_nutritionID
        self.fecesID=_fecesID
        self.urineID=_urineID
        self.vomitusID=_vomitusID
        self.fecesID=_fecesID
        self.sleepID=_sleepID
        
    }
    
    init(json:[String:Any]) {
        basicEventID = json["basicEventID"] as! String
        nutritionID = json["nutritionID"] as! String
        fecesID = json["fecesID"] as! String
        urineID = json["urineID"] as! String
        vomitusID = json["vomitusID"] as! String
        feverID = json["feverID"] as! String
        sleepID = json["sleepID"] as! String
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["basicEventID"] = liquidFoodID
        json["nutritionID"] = nutritionID
        json["fecesID"] = fecesID
        json["urineID"] = urineID
        json["vomitusID"] = vomitusID
        json["feverID"] = feverID
        json["sleepID"] = sleepID
        return json
        
    }
    
}

