//
//  Staff+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Staff {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Staff> {
        return NSFetchRequest<Staff>(entityName: "Staff")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var image: String?
    @NSManaged public var lastName: String?
    @NSManaged public var staffID: String?
    @NSManaged public var basicEvents: NSSet?

}

// MARK: Generated accessors for basicEvents
extension Staff {

    @objc(addBasicEventsObject:)
    @NSManaged public func addToBasicEvents(_ value: BasicEvent)

    @objc(removeBasicEventsObject:)
    @NSManaged public func removeFromBasicEvents(_ value: BasicEvent)

    @objc(addBasicEvents:)
    @NSManaged public func addToBasicEvents(_ values: NSSet)

    @objc(removeBasicEvents:)
    @NSManaged public func removeFromBasicEvents(_ values: NSSet)

}
