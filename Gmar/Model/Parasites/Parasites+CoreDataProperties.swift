//
//  Parasites+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 26/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Parasites {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Parasites> {
        return NSFetchRequest<Parasites>(entityName: "Parasites")
    }

    @NSManaged public var type: String?

}
