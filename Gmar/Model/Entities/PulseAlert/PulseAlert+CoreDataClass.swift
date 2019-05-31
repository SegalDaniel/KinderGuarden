//
//  PulseAlert+CoreDataClass.swift
//  Gmar
//
//  Created by Daniel Segal on 31/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
//

import Foundation
import CoreData

@objc(PulseAlert)
public class PulseAlert: NSManagedObject {
    convenience init(json:[String:Any]) {
        self.init(entity: Model.instance.pulseAlertEntity, insertInto: Model.instance.managedContext)
        self.setValue(json["alertID"], forKey: "alertID")
        self.setValue(json["alertDate"], forKey: "alertDate")
    }

}
