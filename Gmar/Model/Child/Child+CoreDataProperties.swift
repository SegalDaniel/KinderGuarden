//
//  Child+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 03/04/2019.
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
    @NSManaged public var authorized: NSSet?
    @NSManaged public var pickupHour: String?
    @NSManaged public var allergenics: NSSet?
    @NSManaged public var chronicDiseases: NSSet?
    @NSManaged public var routineMedication: NSSet?
    @NSManaged public var foodList: NSSet?
    
    //MARK: - Child's Entities
    @NSManaged public var attendanceEvents: NSSet?
    @NSManaged public var basicEvents: NSSet?
    @NSManaged public var developmentalEvents: NSSet?

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
