//
//  RoutineMedication+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 02/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(RoutineMedication)
public class RoutineMedication: NSManagedObject {
    convenience init(type:String, child:Child?){
        self.init(entity: Model.instance.routineMedicationEtity, insertInto: Model.instance.managedContext)
        self.setValue(type, forKey: "type")
        self.setValue(child, forKey: "child")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.routineMedicationEtity, insertInto: Model.instance.managedContext)
        self.setValue(json["type"], forKey: "type")
        
    }
    
    func toJson() -> [String:Any]{
        var json = [String:Any]()
        json["type"] = type
        json["childID"] = child?.childID
        return json
        
    }

}
