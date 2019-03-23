//
//  GeneralNote+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(GeneralNote)
public class GeneralNote: NSManagedObject {
    convenience init(childID:String, subject:String, details:String){
        self.init(entity: Model.instance.generalNoteEntity, insertInto: Model.instance.managedContext)
        self.setValue(childID, forKey: "childID")
        self.setValue(subject, forKey: "subject")
        self.setValue(details, forKey: "details")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.generalNoteEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["childID"], forKey: "childID")
        self.setValue(json["subject"], forKey: "subject")
        self.setValue(json["details"], forKey: "details")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["childID"] = childID
        json["subject"] = subject
        json["details"] = details
        return json
        
    }

}
