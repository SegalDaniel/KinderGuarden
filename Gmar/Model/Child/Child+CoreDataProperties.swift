//
//  Child+CoreDataProperties.swift
//  Gmar
//
//  Created by Zach Bachar on 16/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Child {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Child> {
        return NSFetchRequest<Child>(entityName: "Child")
    }

    @NSManaged public var childID: String?
    @NSManaged public var age: String?
    @NSManaged public var name: String?
    @NSManaged public var lastName: String?
    @NSManaged public var gender: String?
    @NSManaged public var image: String?
    @NSManaged public var birthDate: String?

}
