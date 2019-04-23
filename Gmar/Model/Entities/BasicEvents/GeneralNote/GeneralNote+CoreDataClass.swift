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
    
    convenience init(subject:String, details:String, eventType:Int16, eventDate:NSDate, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.generalNoteEntity, insertInto: Model.instance.managedContext)
        self.setValue(subject, forKey: "subject")
        self.setValue(details, forKey: "details")
        self.setValue(eventType, forKey: "eventType")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.generalNoteEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["subject"], forKey: "subject")
        self.setValue(json["details"], forKey: "details")
        self.setValue(json["eventType"], forKey: "eventType")
        self.setValue(json["eventDate"], forKey: "eventDate")
        self.setValue(json["child"], forKey: "child")
        self.setValue(json["staff"], forKey: "staff")
    }
    
    
    override func toJson() -> [String:Any] {
        var json = super.toJson()
        json["subject"] = subject
        json["details"] = details
        return json
        
    }
    
}
