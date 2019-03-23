//
//  GeneralBehavior+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension GeneralBehavior {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeneralBehavior> {
        return NSFetchRequest<GeneralBehavior>(entityName: "GeneralBehavior")
    }

    @NSManaged public var childID: String?
    @NSManaged public var type: String?
    @NSManaged public var child: Child?

}
