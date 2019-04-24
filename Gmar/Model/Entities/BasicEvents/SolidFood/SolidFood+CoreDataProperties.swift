//
//  SolidFood+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 07/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension SolidFood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SolidFood> {
        return NSFetchRequest<SolidFood>(entityName: "SolidFood")
    }

    @NSManaged public var amount: Int16
    @NSManaged public var consumedAmount: String?
    @NSManaged public var mealInMenu: String?
    @NSManaged public var mealType: String?

}
