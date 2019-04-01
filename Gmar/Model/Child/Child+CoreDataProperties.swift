//
//  Child+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 01/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    @NSManaged public var birthDate: NSDate?
    @NSManaged public var childID: String?
    @NSManaged public var firstName: String?
    @NSManaged public var gender: String?
    @NSManaged public var isAttend: Bool
    @NSManaged public var isPremature: Bool
    @NSManaged public var lastName: String?
    @NSManaged public var address: String?
    @NSManaged public var pickupHour: String?
    @NSManaged public var foods: String?
    @NSManaged public var allergenic: String?
    @NSManaged public var diseases: String?
    @NSManaged public var medication: String?
    @NSManaged public var attendanceEvents: NSSet?
    @NSManaged public var authorized: NSSet?
    @NSManaged public var basicEvents: NSSet?
    @NSManaged public var developmentalEvents: NSSet?

}

// MARK: Generated accessors for attendanceEvents
extension Child {

    @objc(addAttendanceEventsObject:)
    @NSManaged public func addToAttendanceEvents(_ value: Attendance)

    @objc(removeAttendanceEventsObject:)
    @NSManaged public func removeFromAttendanceEvents(_ value: Attendance)

    @objc(addAttendanceEvents:)
    @NSManaged public func addToAttendanceEvents(_ values: NSSet)

    @objc(removeAttendanceEvents:)
    @NSManaged public func removeFromAttendanceEvents(_ values: NSSet)

}

// MARK: Generated accessors for authorized
extension Child {

    @objc(addAuthorizedObject:)
    @NSManaged public func addToAuthorized(_ value: AuthorizedAccompanist)

    @objc(removeAuthorizedObject:)
    @NSManaged public func removeFromAuthorized(_ value: AuthorizedAccompanist)

    @objc(addAuthorized:)
    @NSManaged public func addToAuthorized(_ values: NSSet)

    @objc(removeAuthorized:)
    @NSManaged public func removeFromAuthorized(_ values: NSSet)

}

// MARK: Generated accessors for basicEvents
extension Child {

    @objc(addBasicEventsObject:)
    @NSManaged public func addToBasicEvents(_ value: BasicEvent)

    @objc(removeBasicEventsObject:)
    @NSManaged public func removeFromBasicEvents(_ value: BasicEvent)

    @objc(addBasicEvents:)
    @NSManaged public func addToBasicEvents(_ values: NSSet)

    @objc(removeBasicEvents:)
    @NSManaged public func removeFromBasicEvents(_ values: NSSet)

}

// MARK: Generated accessors for developmentalEvents
extension Child {

    @objc(addDevelopmentalEventsObject:)
    @NSManaged public func addToDevelopmentalEvents(_ value: DevelopmentalEvent)

    @objc(removeDevelopmentalEventsObject:)
    @NSManaged public func removeFromDevelopmentalEvents(_ value: DevelopmentalEvent)

    @objc(addDevelopmentalEvents:)
    @NSManaged public func addToDevelopmentalEvents(_ values: NSSet)

    @objc(removeDevelopmentalEvents:)
    @NSManaged public func removeFromDevelopmentalEvents(_ values: NSSet)

}
