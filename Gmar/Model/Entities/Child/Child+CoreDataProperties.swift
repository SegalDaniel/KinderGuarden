//
//  Child+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 19/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    //MARK: - Variables
    @NSManaged public var childID: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var gender: String?
    @NSManaged public var birthDate: NSDate?
    @NSManaged public var isPremature: Bool
    @NSManaged public var address: String?
    @NSManaged public var isAttend: Bool
    @NSManaged public var pickupHour: String?
    //MARK: - Child's Prop Entities
    @NSManaged public var authorized: NSSet?
    @NSManaged public var allergenics: NSSet?
    @NSManaged public var chronicDiseases: NSSet?
    @NSManaged public var routineMedication: NSSet?
    @NSManaged public var foodList: NSSet?
    @NSManaged public var alerts: NSSet?
    
    
    //MARK: - Child's Entities
    @NSManaged public var attendanceEvents: NSSet?
    @NSManaged public var basicEvents: NSSet?
    @NSManaged public var developmentalEvents: NSSet?
    @NSManaged public var familyReports: NSSet?
    @NSManaged public var generalNotes: NSSet?

}

// MARK: Generated accessors for alerts
extension Child {

    @objc(addAlertsObject:)
    @NSManaged public func addToAlerts(_ value: Alert)

    @objc(removeAlertsObject:)
    @NSManaged public func removeFromAlerts(_ value: Alert)

    @objc(addAlerts:)
    @NSManaged public func addToAlerts(_ values: NSSet)

    @objc(removeAlerts:)
    @NSManaged public func removeFromAlerts(_ values: NSSet)

}

// MARK: Generated accessors for allergenics
extension Child {

    @objc(addAllergenicsObject:)
    @NSManaged public func addToAllergenics(_ value: Allergenic)

    @objc(removeAllergenicsObject:)
    @NSManaged public func removeFromAllergenics(_ value: Allergenic)

    @objc(addAllergenics:)
    @NSManaged public func addToAllergenics(_ values: NSSet)

    @objc(removeAllergenics:)
    @NSManaged public func removeFromAllergenics(_ values: NSSet)

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

// MARK: Generated accessors for chronicDiseases
extension Child {

    @objc(addChronicDiseasesObject:)
    @NSManaged public func addToChronicDiseases(_ value: ChronicDisease)

    @objc(removeChronicDiseasesObject:)
    @NSManaged public func removeFromChronicDiseases(_ value: ChronicDisease)

    @objc(addChronicDiseases:)
    @NSManaged public func addToChronicDiseases(_ values: NSSet)

    @objc(removeChronicDiseases:)
    @NSManaged public func removeFromChronicDiseases(_ values: NSSet)

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

// MARK: Generated accessors for foodList
extension Child {

    @objc(addFoodListObject:)
    @NSManaged public func addToFoodList(_ value: Food)

    @objc(removeFoodListObject:)
    @NSManaged public func removeFromFoodList(_ value: Food)

    @objc(addFoodList:)
    @NSManaged public func addToFoodList(_ values: NSSet)

    @objc(removeFoodList:)
    @NSManaged public func removeFromFoodList(_ values: NSSet)

}

// MARK: Generated accessors for routineMedication
extension Child {

    @objc(addRoutineMedicationObject:)
    @NSManaged public func addToRoutineMedication(_ value: RoutineMedication)

    @objc(removeRoutineMedicationObject:)
    @NSManaged public func removeFromRoutineMedication(_ value: RoutineMedication)

    @objc(addRoutineMedication:)
    @NSManaged public func addToRoutineMedication(_ values: NSSet)

    @objc(removeRoutineMedication:)
    @NSManaged public func removeFromRoutineMedication(_ values: NSSet)

}

// MARK: Generated accessors for familyReports
extension Child {

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
extension Child {

    @objc(addGeneralNotesObject:)
    @NSManaged public func addToGeneralNotes(_ value: GeneralNote)

    @objc(removeGeneralNotesObject:)
    @NSManaged public func removeFromGeneralNotes(_ value: GeneralNote)

    @objc(addGeneralNotes:)
    @NSManaged public func addToGeneralNotes(_ values: NSSet)

    @objc(removeGeneralNotes:)
    @NSManaged public func removeFromGeneralNotes(_ values: NSSet)

}
