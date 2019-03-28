//
//  LiquidFood+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension LiquidFood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LiquidFood> {
        return NSFetchRequest<LiquidFood>(entityName: "LiquidFood")
    }

    @NSManaged public var amount: String?
    @NSManaged public var consumedAmount: String?
    @NSManaged public var mealType: String?

}
