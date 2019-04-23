//
//  FineMotor+CoreDataProperties.swift
//  Gmar
//
//  Created by Daniel Segal on 30/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData


extension FineMotor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FineMotor> {
        return NSFetchRequest<FineMotor>(entityName: "FineMotor")
    }

    @NSManaged public var type: String?
    @NSManaged public var month: String?

}
