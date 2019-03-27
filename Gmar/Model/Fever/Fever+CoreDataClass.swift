//
//  Fever+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Fever)
public class Fever: BasicEvent {
    convenience init(tempreture:String){
        self.init(entity: Model.instance.feverEntity, insertInto: Model.instance.managedContext)
        self.setValue(tempreture, forKey: "tempreture")
        
    }
    
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.feverEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["tempreture"], forKey: "tempreture")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["tempreture"] = tempreture
        return json
        
    }
    
}
