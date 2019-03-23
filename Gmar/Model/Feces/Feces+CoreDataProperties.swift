//
//  Feces+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Feces {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Feces> {
        return NSFetchRequest<Feces>(entityName: "Feces")
    }

    @NSManaged public var amount: String?
    @NSManaged public var childID: String?
    @NSManaged public var color: String?
    @NSManaged public var texture: String?
    @NSManaged public var eventDate: NSDate?

}