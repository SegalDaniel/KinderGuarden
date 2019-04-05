//
//  Food+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 05/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var details: String?
    @NSManaged public var type: String?
    @NSManaged public var child: Child?

}
