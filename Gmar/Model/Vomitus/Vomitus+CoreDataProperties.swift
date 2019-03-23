//
//  Vomitus+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Vomitus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vomitus> {
        return NSFetchRequest<Vomitus>(entityName: "Vomitus")
    }

    @NSManaged public var childID: String?
    @NSManaged public var proper: Bool
    @NSManaged public var eventDate: NSDate?

}
