//
//  GeneralNote+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(GeneralNote)
public class GeneralNote: BasicEvent {
    
    convenience init(subject:String, details:String, eventDate:String, eventType:Int16){
        self.init(entity: Model.instance.generalNoteEntity, insertInto: Model.instance.managedContext)
        self.setValue(subject, forKey: "subject")
        self.setValue(details, forKey: "details")
        self.setValue(eventDate, forKey: "eventDate")
        
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.generalNoteEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["subject"], forKey: "subject")
        self.setValue(json["details"], forKey: "details")
        
    }
    
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["subject"] = subject
        json["details"] = details
        return json
        
    }
    
}
