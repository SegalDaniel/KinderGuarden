//
//  JsonParsing.swift
//  Gmar
//
//  Created by Zach Bachar on 02/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import CoreData

extension ModelHttp{
    
    func parseBasicEvent(jsonResponse:NSDictionary){
        let att = jsonResponse["attendanceEvent"]! as! NSArray //works
        self.parseAttandanceEvents(jsonArr: att)
        let sle = jsonResponse["sleepEvent"]! as! NSArray //works
        self.parseSleepEvents(jsonArr: sle)
        let wat = jsonResponse["waterEvent"]! as! NSArray //works
        self.parseWaterEvents(jsonArr: wat)
        let sol = jsonResponse["solidFoodEvent"]! as! NSArray //works
        self.parseSolidFoodEvents(jsonArr: sol)
        let liq = jsonResponse["liquidFoodEvent"]! as! NSArray //works
        self.parseLiquidFoodEvents(jsonArr: liq)
        let fec = jsonResponse["fecesEvent"]! as! NSArray //works
        self.parseFecesEvents(jsonArr: fec)
        let uri = jsonResponse["urineEvent"]! as! NSArray //works
        self.parseUrineEvents(jsonArr: uri)
        let cough = jsonResponse["coughEvent"]! as! NSArray //works
        self.parseCoughEvents(jsonArr: cough)
        let sec = jsonResponse["secretionEvent"]! as! NSArray //works
        self.parseSecretionEvents(jsonArr: sec)
        let vom = jsonResponse["vomitusEvent"]! as! NSArray //works
        self.parseVomitusEvents(jsonArr: vom)
        let rash = jsonResponse["rashEvent"]! as! NSArray //works
        self.parseRashEvents(jsonArr: rash)
        let fev = jsonResponse["feverEvent"]! as! NSArray //works
        self.parseFeverEvents(jsonArr: fev)
//        let dis = jsonResponse["diseaseEvent"]! as! NSArray
//        self.parseDiseaseEvents(jsonArr: dis)
//        let med = jsonResponse["medicationEvent"]! as! NSArray
//        self.parseMedicationEvents(jsonArr: med)
//        let par = jsonResponse["parasitesEvent"]! as! NSArray
//        self.parseParasitesEvents(jsonArr: par)
//        let genB = jsonResponse["generalBehaviorEvent"]! as! NSArray
//        self.parseGeneralBehaviorEvents(jsonArr: genB)
        //let genN = jsonResponse["generalNoteEvent"]! as! NSArray
        
        //creates multiple events
        let dev = jsonResponse["developmentalEvent"]! as! NSArray
        self.parsedevelopmentalEvents(jsonArr: dev)

        //let fam = jsonResponse["familyReportEvent"]! as! NSArray
        Model.instance.saveToDB(callback: nil)
    }
    
    
    //MARK: - Attendance
    func parseAttandanceEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Attendance] = []
            let olds = fetch(entityName: "Attendance") as! [Attendance]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                    }
                })
                if !exist{
                    events.append(Attendance(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Sleep
    func parseSleepEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Sleep] = []
            let olds = fetch(entityName: "Sleep") as! [Sleep]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Sleep(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Water
    func parseWaterEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Water] = []
            let olds = fetch(entityName: "Water") as! [Water]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Water(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - SolidFood
    func parseSolidFoodEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[SolidFood] = []
            let olds = fetch(entityName: "SolidFood") as! [SolidFood]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(SolidFood(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - LiquidFood
    func parseLiquidFoodEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[LiquidFood] = []
            let olds = fetch(entityName: "LiquidFood") as! [LiquidFood]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(LiquidFood(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Feces
    func parseFecesEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Feces] = []
            let olds = fetch(entityName: "Feces") as! [Feces]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Feces(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Urine
    func parseUrineEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Urine] = []
            let olds = fetch(entityName: "Urine") as! [Urine]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Urine(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Cough
    func parseCoughEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Cough] = []
            let olds = fetch(entityName: "Cough") as! [Cough]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Cough(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Secretion
    func parseSecretionEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Secretion] = []
            let olds = fetch(entityName: "Secretion") as! [Secretion]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Secretion(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Vomitus
    func parseVomitusEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Vomitus] = []
            let olds = fetch(entityName: "Vomitus") as! [Vomitus]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Vomitus(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Rash
    func parseRashEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Rash] = []
            let olds = fetch(entityName: "Rash") as! [Rash]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Rash(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Fever
    func parseFeverEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Fever] = []
            let olds = fetch(entityName: "Fever") as! [Fever]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Fever(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Disease
    func parseDiseaseEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Disease] = []
            let olds = fetch(entityName: "Disease") as! [Disease]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Disease(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Medication
    func parseMedicationEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Medication] = []
            let olds = fetch(entityName: "Medication") as! [Medication]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Medication(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Parasites
    func parseParasitesEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Parasites] = []
            let olds = fetch(entityName: "Parasites") as! [Parasites]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(Parasites(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - GeneralBehavior
    func parseGeneralBehaviorEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[GeneralBehavior] = []
            let olds = fetch(entityName: "GeneralBehavior") as! [GeneralBehavior]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                        old.setValue(Int16(truncating: jEvent["level"] as! NSNumber), forKey: "level")
                        try? Model.instance.managedContext.save()
                    }
                })
                if !exist{
                    events.append(GeneralBehavior(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Developmental - creates multiple events!
    func parsedevelopmentalEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[DevelopmentalEvent] = []
            let olds = fetchDev(entityName: "DevelopmentalEvent")
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    if old == jEvent{
                        exist = true
                    }
                })
                if !exist{
                    events.append(DevelopmentalEvent(json: jEvent))
                }
            }
        }
    }
   
    func fetch(entityName:String) -> [BasicEvent]?{
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        return try! Model.instance.managedContext.fetch(fetch) as! [BasicEvent]
    }
    func fetchDev(entityName:String) -> [DevelopmentalEvent]{
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        return try! Model.instance.managedContext.fetch(fetch) as! [DevelopmentalEvent]
    }
}
