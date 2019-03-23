//
//  Rash+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Rash {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Rash> {
        return NSFetchRequest<Rash>(entityName: "Rash")
    }

    @NSManaged public var childID: String?
    @NSManaged public var type: String?
    @NSManaged public var area: String?
    @NSManaged public var eventDate: NSDate?

}
