//
//  Vomitus+CoreDataProperties.swift
//  Gmar
//
//  Created by Zach Bachar on 17/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Vomitus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vomitus> {
        return NSFetchRequest<Vomitus>(entityName: "Vomitus")
    }

    @NSManaged public var proper: String?
    @NSManaged public var type: String?

}
