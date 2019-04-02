//
//  Allergenic+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 02/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Allergenic {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Allergenic> {
        return NSFetchRequest<Allergenic>(entityName: "Allergenic")
    }

    @NSManaged public var type: String?
    @NSManaged public var child: Child?

}
