//
//  GeneralNote+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 19/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(GeneralNote)
public class GeneralNote: NSManagedObject {
    convenience init(details:String, eventID:Int16, eventDate:Date, child:Child?, staff:Staff?){
        self.init(entity: Model.instance.generalNoteEntity, insertInto: Model.instance.managedContext)
        self.setValue(details, forKey: "details")
        self.setValue(eventID, forKey: "eventID")
        self.setValue(eventDate, forKey: "eventDate")
        self.setValue(child, forKey: "child")
        self.setValue(staff, forKey: "staff")
    }
    
    convenience  init(json:[String:Any]) {
        self.init(entity: Model.instance.generalNoteEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["details"], forKey: "details")
        self.setValue(json["eventID"], forKey: "eventID")
        self.setValue(json["eventDate"], forKey: "eventDate")
    }
    
    func toJson() -> [String:Any] {
        var json = [String:Any]()
        json["details"] = details
        json["eventID"] = eventID
        json["eventDate"] = eventDate
        json["childID"] = child?.childID
        json["staffID"] = staff?.staffID
        return json
    }

}
