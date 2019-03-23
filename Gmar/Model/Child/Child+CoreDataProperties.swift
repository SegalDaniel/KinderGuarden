//
//  Child+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
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
    @NSManaged public var authorized: NSSet?
    @NSManaged public var diseaseEvents: NSSet?
    @NSManaged public var fecesEvents: NSSet?
    @NSManaged public var feverEvents: NSSet?
    @NSManaged public var liquidFoodEvents: NSSet?
    @NSManaged public var medicationEvents: NSSet?
    @NSManaged public var rashEvents: NSSet?
    @NSManaged public var sleepEvents: NSSet?
    @NSManaged public var solidFoodEvents: NSSet?
    @NSManaged public var urineEvents: NSSet?
    @NSManaged public var vomitusEvents: NSSet?
    @NSManaged public var waterEvents: NSSet?

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

// MARK: Generated accessors for diseaseEvents
extension Child {

    @objc(addDiseaseEventsObject:)
    @NSManaged public func addToDiseaseEvents(_ value: Disease)

    @objc(removeDiseaseEventsObject:)
    @NSManaged public func removeFromDiseaseEvents(_ value: Disease)

    @objc(addDiseaseEvents:)
    @NSManaged public func addToDiseaseEvents(_ values: NSSet)

    @objc(removeDiseaseEvents:)
    @NSManaged public func removeFromDiseaseEvents(_ values: NSSet)

}

// MARK: Generated accessors for fecesEvents
extension Child {

    @objc(addFecesEventsObject:)
    @NSManaged public func addToFecesEvents(_ value: Feces)

    @objc(removeFecesEventsObject:)
    @NSManaged public func removeFromFecesEvents(_ value: Feces)

    @objc(addFecesEvents:)
    @NSManaged public func addToFecesEvents(_ values: NSSet)

    @objc(removeFecesEvents:)
    @NSManaged public func removeFromFecesEvents(_ values: NSSet)

}

// MARK: Generated accessors for feverEvents
extension Child {

    @objc(addFeverEventsObject:)
    @NSManaged public func addToFeverEvents(_ value: Fever)

    @objc(removeFeverEventsObject:)
    @NSManaged public func removeFromFeverEvents(_ value: Fever)

    @objc(addFeverEvents:)
    @NSManaged public func addToFeverEvents(_ values: NSSet)

    @objc(removeFeverEvents:)
    @NSManaged public func removeFromFeverEvents(_ values: NSSet)

}

// MARK: Generated accessors for liquidFoodEvents
extension Child {

    @objc(addLiquidFoodEventsObject:)
    @NSManaged public func addToLiquidFoodEvents(_ value: LiquidFood)

    @objc(removeLiquidFoodEventsObject:)
    @NSManaged public func removeFromLiquidFoodEvents(_ value: LiquidFood)

    @objc(addLiquidFoodEvents:)
    @NSManaged public func addToLiquidFoodEvents(_ values: NSSet)

    @objc(removeLiquidFoodEvents:)
    @NSManaged public func removeFromLiquidFoodEvents(_ values: NSSet)

}

// MARK: Generated accessors for medicationEvents
extension Child {

    @objc(addMedicationEventsObject:)
    @NSManaged public func addToMedicationEvents(_ value: Medication)

    @objc(removeMedicationEventsObject:)
    @NSManaged public func removeFromMedicationEvents(_ value: Medication)

    @objc(addMedicationEvents:)
    @NSManaged public func addToMedicationEvents(_ values: NSSet)

    @objc(removeMedicationEvents:)
    @NSManaged public func removeFromMedicationEvents(_ values: NSSet)

}

// MARK: Generated accessors for rashEvents
extension Child {

    @objc(addRashEventsObject:)
    @NSManaged public func addToRashEvents(_ value: Rash)

    @objc(removeRashEventsObject:)
    @NSManaged public func removeFromRashEvents(_ value: Rash)

    @objc(addRashEvents:)
    @NSManaged public func addToRashEvents(_ values: NSSet)

    @objc(removeRashEvents:)
    @NSManaged public func removeFromRashEvents(_ values: NSSet)

}

// MARK: Generated accessors for sleepEvents
extension Child {

    @objc(addSleepEventsObject:)
    @NSManaged public func addToSleepEvents(_ value: Sleep)

    @objc(removeSleepEventsObject:)
    @NSManaged public func removeFromSleepEvents(_ value: Sleep)

    @objc(addSleepEvents:)
    @NSManaged public func addToSleepEvents(_ values: NSSet)

    @objc(removeSleepEvents:)
    @NSManaged public func removeFromSleepEvents(_ values: NSSet)

}

// MARK: Generated accessors for solidFoodEvents
extension Child {

    @objc(addSolidFoodEventsObject:)
    @NSManaged public func addToSolidFoodEvents(_ value: SolidFood)

    @objc(removeSolidFoodEventsObject:)
    @NSManaged public func removeFromSolidFoodEvents(_ value: SolidFood)

    @objc(addSolidFoodEvents:)
    @NSManaged public func addToSolidFoodEvents(_ values: NSSet)

    @objc(removeSolidFoodEvents:)
    @NSManaged public func removeFromSolidFoodEvents(_ values: NSSet)

}

// MARK: Generated accessors for urineEvents
extension Child {

    @objc(addUrineEventsObject:)
    @NSManaged public func addToUrineEvents(_ value: Urine)

    @objc(removeUrineEventsObject:)
    @NSManaged public func removeFromUrineEvents(_ value: Urine)

    @objc(addUrineEvents:)
    @NSManaged public func addToUrineEvents(_ values: NSSet)

    @objc(removeUrineEvents:)
    @NSManaged public func removeFromUrineEvents(_ values: NSSet)

}

// MARK: Generated accessors for vomitusEvents
extension Child {

    @objc(addVomitusEventsObject:)
    @NSManaged public func addToVomitusEvents(_ value: Vomitus)

    @objc(removeVomitusEventsObject:)
    @NSManaged public func removeFromVomitusEvents(_ value: Vomitus)

    @objc(addVomitusEvents:)
    @NSManaged public func addToVomitusEvents(_ values: NSSet)

    @objc(removeVomitusEvents:)
    @NSManaged public func removeFromVomitusEvents(_ values: NSSet)

}

// MARK: Generated accessors for waterEvents
extension Child {

    @objc(addWaterEventsObject:)
    @NSManaged public func addToWaterEvents(_ value: Water)

    @objc(removeWaterEventsObject:)
    @NSManaged public func removeFromWaterEvents(_ value: Water)

    @objc(addWaterEvents:)
    @NSManaged public func addToWaterEvents(_ values: NSSet)

    @objc(removeWaterEvents:)
    @NSManaged public func removeFromWaterEvents(_ values: NSSet)

}
