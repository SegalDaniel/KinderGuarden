//
//  RoutineMedication+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 02/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension RoutineMedication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoutineMedication> {
        return NSFetchRequest<RoutineMedication>(entityName: "RoutineMedication")
    }

    @NSManaged public var type: String?
    @NSManaged public var child: Child?

}
