//
//  BasicEvent+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 25/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension BasicEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BasicEvent> {
        return NSFetchRequest<BasicEvent>(entityName: "BasicEvent")
    }

    @NSManaged public var eventDate: NSDate?
    @NSManaged public var eventType: Int16
    @NSManaged public var level: Int16
    @NSManaged public var child: Child?
    @NSManaged public var staff: Staff?

}
