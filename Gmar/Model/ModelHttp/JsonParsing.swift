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
        let att = jsonResponse["attendanceEvent"]! as! NSArray
        self.parseAttandanceEvents(jsonArr: att)
        let cough = jsonResponse["coughEvent"]! as! NSArray
        self.parseCoughEvents(jsonArr: cough)
        //let dev = jsonResponse["developmentalEvent"]! as! NSArray
       //let dis = jsonResponse["diseaseEvent"]! as! NSArray
       //let fam = jsonResponse["familyReportEvent"]! as! NSArray
       //let fec = jsonResponse["fecesEvent"]! as! NSArray
       //let fev = jsonResponse["feverEvent"]! as! NSArray
       //let genB = jsonResponse["generalBehaviorEvent"]! as! NSArray
       //let genN = jsonResponse["generalNoteEvent"]! as! NSArray
       //let med = jsonResponse["medicationEvent"]! as! NSArray
       //let par = jsonResponse["parasitesEvent"]! as! NSArray
       //let rash = jsonResponse["rashEvent"]! as! NSArray
       //let sec = jsonResponse["secretionEvent"]! as! NSArray
       //let sle = jsonResponse["sleepEvent"]! as! NSArray
       //let sol = jsonResponse["solidFoodEvent"]! as! NSArray
       //let uri = jsonResponse["urineEvent"]! as! NSArray
       //let vom = jsonResponse["vomitusEvent"]! as! NSArray
       //let wat = jsonResponse["waterEvent"]! as! NSArray
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
                    exist = old == jEvent
                })
                if !exist{
                    events.append(Attendance(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Cough
    func parseCoughEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Cough] = []
            let olds = fetch(entityName: "Cough") as! [Attendance]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    exist = old == jEvent
                })
                if !exist{
                    events.append(Cough(json: jEvent))
                }
            }
        }
    }
    
    //MARK: - Disease
    func parseDiseaseEvents(jsonArr:NSArray){
        if jsonArr.count > 0{
            var events:[Disease] = []
            let olds = fetch(entityName: "Disease") as! [Attendance]
            jsonArr.forEach { (jsonEvent) in
                let jEvent = jsonEvent as! [String:Any]
                var exist = false
                olds.forEach({ (old) in
                    exist = old == jEvent
                })
                if !exist{
                    events.append(Disease(json: jEvent))
                }
            }
        }
    }
    
    func fetch(entityName:String) -> [BasicEvent]?{
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        return try! Model.instance.managedContext.fetch(fetch) as! [BasicEvent]
    }
}
