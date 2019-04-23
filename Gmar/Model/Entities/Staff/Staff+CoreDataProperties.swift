//
//  Staff+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 28/03/2019.
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
    @NSManaged public var attendanceEvents: NSSet?
    @NSManaged public var developmentalEvents: NSSet?

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

// MARK: Generated accessors for attendanceEvents
extension Staff {

    @objc(addAttendanceEventsObject:)
    @NSManaged public func addToAttendanceEvents(_ value: Attendance)

    @objc(removeAttendanceEventsObject:)
    @NSManaged public func removeFromAttendanceEvents(_ value: Attendance)

    @objc(addAttendanceEvents:)
    @NSManaged public func addToAttendanceEvents(_ values: NSSet)

    @objc(removeAttendanceEvents:)
    @NSManaged public func removeFromAttendanceEvents(_ values: NSSet)

}

// MARK: Generated accessors for developmentalEvents
extension Staff {

    @objc(addDevelopmentalEventsObject:)
    @NSManaged public func addToDevelopmentalEvents(_ value: DevelopmentalEvent)

    @objc(removeDevelopmentalEventsObject:)
    @NSManaged public func removeFromDevelopmentalEvents(_ value: DevelopmentalEvent)

    @objc(addDevelopmentalEvents:)
    @NSManaged public func addToDevelopmentalEvents(_ values: NSSet)

    @objc(removeDevelopmentalEvents:)
    @NSManaged public func removeFromDevelopmentalEvents(_ values: NSSet)

}
