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
    @NSManaged public var gender: String?
    @NSManaged public var isPremature: Bool
    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    @NSManaged public var isAttend: Bool
    @NSManaged public var sleeps: NSSet?
    @NSManaged public var fever: NSSet?
    @NSManaged public var rashes: NSSet?
    @NSManaged public var liquidFoods: NSSet?
    @NSManaged public var solidFoods: NSSet?
    @NSManaged public var water: NSSet?
    @NSManaged public var feces: NSSet?
    @NSManaged public var urine: NSSet?
    @NSManaged public var vomitus: NSSet?
    @NSManaged public var authorized: NSSet?
    @NSManaged public var medicine: NSSet?
    @NSManaged public var disease: NSSet?

}

// MARK: Generated accessors for sleeps
extension Child {

    @objc(addSleepsObject:)
    @NSManaged public func addToSleeps(_ value: Sleep)

    @objc(removeSleepsObject:)
    @NSManaged public func removeFromSleeps(_ value: Sleep)

    @objc(addSleeps:)
    @NSManaged public func addToSleeps(_ values: NSSet)

    @objc(removeSleeps:)
    @NSManaged public func removeFromSleeps(_ values: NSSet)

}

// MARK: Generated accessors for fever
extension Child {

    @objc(addFeverObject:)
    @NSManaged public func addToFever(_ value: Fever)

    @objc(removeFeverObject:)
    @NSManaged public func removeFromFever(_ value: Fever)

    @objc(addFever:)
    @NSManaged public func addToFever(_ values: NSSet)

    @objc(removeFever:)
    @NSManaged public func removeFromFever(_ values: NSSet)

}

// MARK: Generated accessors for rashes
extension Child {

    @objc(addRashesObject:)
    @NSManaged public func addToRashes(_ value: Rash)

    @objc(removeRashesObject:)
    @NSManaged public func removeFromRashes(_ value: Rash)

    @objc(addRashes:)
    @NSManaged public func addToRashes(_ values: NSSet)

    @objc(removeRashes:)
    @NSManaged public func removeFromRashes(_ values: NSSet)

}

// MARK: Generated accessors for liquidFoods
extension Child {

    @objc(addLiquidFoodsObject:)
    @NSManaged public func addToLiquidFoods(_ value: LiquidFood)

    @objc(removeLiquidFoodsObject:)
    @NSManaged public func removeFromLiquidFoods(_ value: LiquidFood)

    @objc(addLiquidFoods:)
    @NSManaged public func addToLiquidFoods(_ values: NSSet)

    @objc(removeLiquidFoods:)
    @NSManaged public func removeFromLiquidFoods(_ values: NSSet)

}

// MARK: Generated accessors for solidFoods
extension Child {

    @objc(addSolidFoodsObject:)
    @NSManaged public func addToSolidFoods(_ value: SolidFood)

    @objc(removeSolidFoodsObject:)
    @NSManaged public func removeFromSolidFoods(_ value: SolidFood)

    @objc(addSolidFoods:)
    @NSManaged public func addToSolidFoods(_ values: NSSet)

    @objc(removeSolidFoods:)
    @NSManaged public func removeFromSolidFoods(_ values: NSSet)

}

// MARK: Generated accessors for water
extension Child {

    @objc(addWaterObject:)
    @NSManaged public func addToWater(_ value: Water)

    @objc(removeWaterObject:)
    @NSManaged public func removeFromWater(_ value: Water)

    @objc(addWater:)
    @NSManaged public func addToWater(_ values: NSSet)

    @objc(removeWater:)
    @NSManaged public func removeFromWater(_ values: NSSet)

}

// MARK: Generated accessors for feces
extension Child {

    @objc(addFecesObject:)
    @NSManaged public func addToFeces(_ value: Feces)

    @objc(removeFecesObject:)
    @NSManaged public func removeFromFeces(_ value: Feces)

    @objc(addFeces:)
    @NSManaged public func addToFeces(_ values: NSSet)

    @objc(removeFeces:)
    @NSManaged public func removeFromFeces(_ values: NSSet)

}

// MARK: Generated accessors for urine
extension Child {

    @objc(addUrineObject:)
    @NSManaged public func addToUrine(_ value: Urine)

    @objc(removeUrineObject:)
    @NSManaged public func removeFromUrine(_ value: Urine)

    @objc(addUrine:)
    @NSManaged public func addToUrine(_ values: NSSet)

    @objc(removeUrine:)
    @NSManaged public func removeFromUrine(_ values: NSSet)

}

// MARK: Generated accessors for vomitus
extension Child {

    @objc(addVomitusObject:)
    @NSManaged public func addToVomitus(_ value: Vomitus)

    @objc(removeVomitusObject:)
    @NSManaged public func removeFromVomitus(_ value: Vomitus)

    @objc(addVomitus:)
    @NSManaged public func addToVomitus(_ values: NSSet)

    @objc(removeVomitus:)
    @NSManaged public func removeFromVomitus(_ values: NSSet)

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

// MARK: Generated accessors for medicine
extension Child {

    @objc(addMedicineObject:)
    @NSManaged public func addToMedicine(_ value: Medication)

    @objc(removeMedicineObject:)
    @NSManaged public func removeFromMedicine(_ value: Medication)

    @objc(addMedicine:)
    @NSManaged public func addToMedicine(_ values: NSSet)

    @objc(removeMedicine:)
    @NSManaged public func removeFromMedicine(_ values: NSSet)

}

// MARK: Generated accessors for disease
extension Child {

    @objc(addDiseaseObject:)
    @NSManaged public func addToDisease(_ value: Disease)

    @objc(removeDiseaseObject:)
    @NSManaged public func removeFromDisease(_ value: Disease)

    @objc(addDisease:)
    @NSManaged public func addToDisease(_ values: NSSet)

    @objc(removeDisease:)
    @NSManaged public func removeFromDisease(_ values: NSSet)

}
