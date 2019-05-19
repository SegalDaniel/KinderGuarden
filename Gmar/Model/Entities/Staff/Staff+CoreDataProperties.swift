//
//  Staff+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 19/05/2019.
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
    @NSManaged public var developmentalEvents: NSSet?
    @NSManaged public var familyReports: NSSet?
    @NSManaged public var generalNotes: NSSet?

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

// MARK: Generated accessors for familyReports
extension Staff {

    @objc(addFamilyReportsObject:)
    @NSManaged public func addToFamilyReports(_ value: FamilyReport)

    @objc(removeFamilyReportsObject:)
    @NSManaged public func removeFromFamilyReports(_ value: FamilyReport)

    @objc(addFamilyReports:)
    @NSManaged public func addToFamilyReports(_ values: NSSet)

    @objc(removeFamilyReports:)
    @NSManaged public func removeFromFamilyReports(_ values: NSSet)

}

// MARK: Generated accessors for generalNotes
extension Staff {

    @objc(addGeneralNotesObject:)
    @NSManaged public func addToGeneralNotes(_ value: GeneralNote)

    @objc(removeGeneralNotesObject:)
    @NSManaged public func removeFromGeneralNotes(_ value: GeneralNote)

    @objc(addGeneralNotes:)
    @NSManaged public func addToGeneralNotes(_ values: NSSet)

    @objc(removeGeneralNotes:)
    @NSManaged public func removeFromGeneralNotes(_ values: NSSet)

}
