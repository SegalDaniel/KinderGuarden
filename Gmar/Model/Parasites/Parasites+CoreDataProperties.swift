//
//  Parasites+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Parasites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Parasites> {
        return NSFetchRequest<Parasites>(entityName: "Parasites")
    }

    @NSManaged public var childID: String?
    @NSManaged public var type: String?
    @NSManaged public var child: Child?

}
