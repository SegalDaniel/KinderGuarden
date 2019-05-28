//
//  DevelopmentalEvent+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 28/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension DevelopmentalEvent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DevelopmentalEvent> {
        return NSFetchRequest<DevelopmentalEvent>(entityName: "DevelopmentalEvent")
    }

    @NSManaged public var eventDate: NSDate?
    @NSManaged public var eventType: Int16
    @NSManaged public var eventID: Int16
    @NSManaged public var child: Child?
    @NSManaged public var staff: Staff?

}
