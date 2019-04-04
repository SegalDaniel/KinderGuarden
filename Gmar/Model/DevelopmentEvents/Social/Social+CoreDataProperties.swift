//
//  Social+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 04/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension Social {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Social> {
        return NSFetchRequest<Social>(entityName: "Social")
    }

    @NSManaged public var month: String?
    @NSManaged public var type: String?

}
