//
//  ChronicDisease+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 02/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension ChronicDisease {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ChronicDisease> {
        return NSFetchRequest<ChronicDisease>(entityName: "ChronicDisease")
    }

    @NSManaged public var type: String?
    @NSManaged public var child: Child?

}
