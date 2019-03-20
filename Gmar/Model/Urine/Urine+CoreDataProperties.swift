//
//  Urine+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Urine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Urine> {
        return NSFetchRequest<Urine>(entityName: "Urine")
    }

    @NSManaged public var childID: String?
    @NSManaged public var color: String?
    @NSManaged public var fragrance: String?
    @NSManaged public var amount: String?

}
