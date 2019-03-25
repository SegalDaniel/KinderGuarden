//
//  Secretion+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 25/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Secretion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Secretion> {
        return NSFetchRequest<Secretion>(entityName: "Secretion")
    }

    @NSManaged public var area: String?
    @NSManaged public var childID: String?
    @NSManaged public var rank: String?
    @NSManaged public var type: String?

}
