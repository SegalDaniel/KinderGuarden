//
//  Child+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    @NSManaged public var birthDate: NSDate?
    @NSManaged public var childID: String?
    @NSManaged public var gender: String?
    @NSManaged public var isPremature: Bool
    @NSManaged public var lastName: String?
    @NSManaged public var firstName: String?
    @NSManaged public var isAttend: Bool

}
