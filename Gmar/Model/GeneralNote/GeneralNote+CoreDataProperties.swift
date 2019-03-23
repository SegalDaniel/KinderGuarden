//
//  GeneralNote+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension GeneralNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GeneralNote> {
        return NSFetchRequest<GeneralNote>(entityName: "GeneralNote")
    }

    @NSManaged public var childID: String?
    @NSManaged public var subject: String?
    @NSManaged public var details: String?
    @NSManaged public var child: Child?

}
