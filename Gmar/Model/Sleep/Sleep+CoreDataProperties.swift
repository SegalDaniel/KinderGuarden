//
//  Sleep+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 17/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Sleep {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sleep> {
        return NSFetchRequest<Sleep>(entityName: "Sleep")
    }

    @NSManaged public var childID: String?
    @NSManaged public var type: String?
    @NSManaged public var allocatedTime: String?
    @NSManaged public var sleepingScope: String?

}
