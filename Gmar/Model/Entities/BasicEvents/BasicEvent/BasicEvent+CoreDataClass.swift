//
//  BasicEvent+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 28/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.

import Foundation
import CoreData

@objc(BasicEvent)
public class BasicEvent: NSManagedObject {
    
    func toJson() -> [String:Any]{
        var json = [String:Any]()
        json["eventType"] = eventType
        json["eventID"] = child?.childID.hashValue
        json["eventDate"] = eventDate
        json["level"] = level
        json["childID"] = child?.childID
        json["staffID"] = staff?.staffID
        return json
        
    }
}
