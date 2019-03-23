//
//  Fever+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Fever {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Fever> {
        return NSFetchRequest<Fever>(entityName: "Fever")
    }

    @NSManaged public var childID: String?
    @NSManaged public var tempreture: String?
    @NSManaged public var eventDate: NSDate?

}
