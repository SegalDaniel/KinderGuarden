//
//  Model.swift
//  Gmar
//
//  Created by Zach Bachar on 16/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit
//import FirebaseFirestore
import CoreData

class Model{
    //MARK: - Variables
    static let instance:Model = Model()
    //var modelFirebase = ModelFireBase()
    var modelHttp = ModelHttp()
    let appDelegate:AppDelegate
    let managedContext:NSManagedObjectContext
    
    //MARK: - NSEnteties
    let staffEntity:NSEntityDescription
    let childEntity:NSEntityDescription
    
    //MARK: - Child Entities
    let authorizedAccompanistEntity:NSEntityDescription
    let attendanceEntity:NSEntityDescription
    let allergenicEntity:NSEntityDescription
    let chronicDiseaseEntity:NSEntityDescription
    let routineMedicationEtity:NSEntityDescription
    let foodEntity:NSEntityDescription
    let alertEntity:NSEntityDescription
    
    //MARK: - Basic Events Entities
    //    let basicEventEntity:NSEntityDescription
    let sleepEntity:NSEntityDescription
    let waterEntity:NSEntityDescription
    let solidFoodEntity:NSEntityDescription
    let liquidFoodEntity:NSEntityDescription
    let fecesEntity:NSEntityDescription
    let urineEntity:NSEntityDescription
    let coughEntity:NSEntityDescription
    let secretionEntity:NSEntityDescription
    let vomitusEntity:NSEntityDescription
    let rashEntity:NSEntityDescription
    let feverEntity:NSEntityDescription
    let diseaseEntity:NSEntityDescription
    let medicationEntity:NSEntityDescription
    let parasitesEntity:NSEntityDescription
    let generalBehaviorEntity:NSEntityDescription
    let generalNoteEntity:NSEntityDescription
    
    
    //MARK: - Development Events Entities
    //    let developmentEventEntity:NSEntityDescription
    let fineMotorEventEntity:NSEntityDescription
    let grossMotorEventEntity:NSEntityDescription
    let socialEventEntity:NSEntityDescription
    
    //MARK: - init
    private init(){
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        staffEntity = NSEntityDescription.entity(forEntityName: "Staff", in: managedContext)!
        childEntity = NSEntityDescription.entity(forEntityName: "Child", in: managedContext)!
        sleepEntity = NSEntityDescription.entity(forEntityName: "Sleep", in: managedContext)!
        feverEntity = NSEntityDescription.entity(forEntityName: "Fever", in: managedContext)!
        rashEntity = NSEntityDescription.entity(forEntityName: "Rash", in: managedContext)!
        liquidFoodEntity = NSEntityDescription.entity(forEntityName: "LiquidFood", in: managedContext)!
        solidFoodEntity = NSEntityDescription.entity(forEntityName: "SolidFood", in: managedContext)!
        waterEntity = NSEntityDescription.entity(forEntityName: "Water", in: managedContext)!
        fecesEntity = NSEntityDescription.entity(forEntityName: "Feces", in: managedContext)!
        urineEntity = NSEntityDescription.entity(forEntityName: "Urine", in: managedContext)!
        vomitusEntity = NSEntityDescription.entity(forEntityName: "Vomitus", in: managedContext)!
        authorizedAccompanistEntity = NSEntityDescription.entity(forEntityName: "AuthorizedAccompanist", in: managedContext)!
        medicationEntity = NSEntityDescription.entity(forEntityName: "Medication", in: managedContext)!
        diseaseEntity = NSEntityDescription.entity(forEntityName: "Disease", in: managedContext)!
        attendanceEntity = NSEntityDescription.entity(forEntityName: "Attendance", in: managedContext)!
        coughEntity = NSEntityDescription.entity(forEntityName: "Cough", in: managedContext)!
        parasitesEntity = NSEntityDescription.entity(forEntityName: "Parasites", in: managedContext)!
        secretionEntity = NSEntityDescription.entity(forEntityName: "Secretion", in: managedContext)!
        generalBehaviorEntity = NSEntityDescription.entity(forEntityName: "GeneralBehavior", in: managedContext)!
        generalNoteEntity = NSEntityDescription.entity(forEntityName: "GeneralNote", in: managedContext)!
        fineMotorEventEntity = NSEntityDescription.entity(forEntityName: "FineMotor", in: managedContext)!
        grossMotorEventEntity = NSEntityDescription.entity(forEntityName: "GrossMotor", in: managedContext)!
        allergenicEntity  = NSEntityDescription.entity(forEntityName: "Allergenic", in: managedContext)!
        chronicDiseaseEntity = NSEntityDescription.entity(forEntityName: "ChronicDisease", in: managedContext)!
        routineMedicationEtity = NSEntityDescription.entity(forEntityName: "RoutineMedication", in: managedContext)!
        foodEntity = NSEntityDescription.entity(forEntityName: "Food", in: managedContext)!
        socialEventEntity = NSEntityDescription.entity(forEntityName: "Social", in: managedContext)!
        alertEntity = NSEntityDescription.entity(forEntityName: "Alert", in: managedContext)!
        
    }
    /******************** Offline changes - Replace all comments for FireBase connection**********************/
    /*
    //MARK: - Child Model Methods
    func getChild(childID:String, callback:@escaping (Error?, Child?)->Void){
        modelFirebase.getChild(childID: childID, callback: callback)
    }
    
    //MARK: - Firestore methods
    func signIn(){
        modelFirebase.signIn(mail: "baby@guard.com", pass: "123456") { (result, err) in
            print(result.debugDescription)
        }
    }
    
    func checkIfSignedIn() -> Bool{
        return modelFirebase.checkIfSignIn()
    }
    
    func deleteDocument(collection:String, docID:String, callack:@escaping (Error?)->Void){
        modelFirebase.removeDocument(collection: collection, docID: docID, callack: callack)
    }
    */
    
    func sendToFB(basicEvent:BasicEvent, callack:@escaping (Error?)->Void){
        saveToDB(callback: nil)
        callack(nil)
        /*
        modelFirebase.sendBasicEvent(basicEvent: basicEvent) { (err) in
            if err == nil{
                do{
                    try Model.instance.managedContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
            callack(err)
        }*/
    }
    
    func sendToFB(attandanceEvent:Attendance, callack:@escaping (Error?)->Void){
        saveToDB(callback: nil)
        callack(nil)
        /*modelFirebase.sendAttandanceEvent(event: attandanceEvent) { (err) in
            if err == nil{
                do{
                    try Model.instance.managedContext.save()
                } catch let error as NSError{
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
            callack(err)
        }*/
    }
    
    
    func sendToFB(child:Child, callack:@escaping (Error?)->Void){
        saveToDB(callback: nil)
        callack(nil)
        /*modelFirebase.sendChild(child: child) { (err) in
            if err == nil{
                do{
                    try Model.instance.managedContext.save()
                } catch let error as NSError{
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
            callack(err)
        }*/
        
    }
    
    func sendToFB(staff:Staff, callack:@escaping (Error?)->Void){
        saveToDB(callback: nil)
        callack(nil)
        /*modelFirebase.sendStaff(staff: staff) { (err) in
            if err == nil{
                do{
                    try Model.instance.managedContext.save()
                } catch let error as NSError{
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
            callack(err)
        }*/
    }
    
    /******************** Offline changes - Replace all comments for FireBase connection**********************/
    
    //MARK: - CoreData
    //MARK: - child entity methods
    func getAllChildsFromCore(callback:([Child])->Void){
        let childFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Child")
        let childs = try! Model.instance.managedContext.fetch(childFetch)
        let c:[Child] = childs as! [Child]
        callback(c)
    }
    
    func getAllAttendedChildsFromCore(callback:([Child])->Void){
        let childFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Child")
        let childs = try! Model.instance.managedContext.fetch(childFetch)
        let c:[Child] = childs as! [Child]
        let filtered = c.filter { (child) -> Bool in
            return child.isAttend
        }
        callback(filtered)
    }
    
    func getChild(childID:String, callback:(Child)->Void){
        let childFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Child")
        childFetch.predicate = NSPredicate(format: "childID = %@", childID)
        let child:[Child] = try! Model.instance.managedContext.fetch(childFetch) as! [Child]
        callback(child.first!)
    }
    
    func deleteChildFromDB(childID:String, callback:(NSError?)->Void){
        let childFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Child")
        let child = try! Model.instance.managedContext.fetch(childFetch) as! [Child]
        let toDelete = child.filter { (member) -> Bool in
            if member.childID == childID {
                return true
            }
            return false
        }
        if let obj = toDelete.first {
            managedContext.delete(obj)
            removeImageFromDisk(imageName: obj.childID!)
            do{
                try Model.instance.managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
                callback(error)
            }
            callback(nil)
        }
        else{
            callback(NSError(domain: "no id found", code: 0, userInfo: nil))
        }
    }
    
    func eventChildAndStaff(childID:String, staffID:String){
        let childFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Child")
        childFetch.predicate = NSPredicate(format: "childID = %@", childID)
        let child:[Child] = try! Model.instance.managedContext.fetch(childFetch) as! [Child]
        let staffFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Staff")
        staffFetch.predicate = NSPredicate(format: "staffID = %@", staffID)
        let staff:[Staff] = try! Model.instance.managedContext.fetch(staffFetch) as! [Staff]
        ModelNotification.childAndStaffNotification.notify(data: (child.first!, staff.first!))
    }
    
    func getAuthorized(authName:String, callback:(AuthorizedAccompanist?)->Void){
        let authFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "AuthorizedAccompanist")
        authFetch.predicate = NSPredicate(format: "name = %@", authName)
        let auth:[AuthorizedAccompanist] = try! Model.instance.managedContext.fetch(authFetch) as! [AuthorizedAccompanist]
        callback(auth.first)
    }
    
    //MARK: - staff entity methods
    func getStaffFromDB(callback:@escaping ([Staff]) -> Void){
        let staffFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Staff")
        let staff = try! Model.instance.managedContext.fetch(staffFetch) as! [Staff]
        callback(staff)
    }
    
    func deleteStaffFromDB(staffID:String, callback:(NSError?)->Void){
        let staffFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Staff")
        let staff = try! Model.instance.managedContext.fetch(staffFetch) as! [Staff]
        let toDelete = staff.filter { (member) -> Bool in
            if member.staffID == staffID {
                return true
            }
            return false
        }
        if let obj = toDelete.first {
            managedContext.delete(obj)
            if let imageName = obj.image{
                removeImageFromDisk(imageName: imageName)
            }
            do{
                try Model.instance.managedContext.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
                callback(error)
            }
            callback(nil)
        }
        else{
            callback(NSError(domain: "no id found", code: 0, userInfo: nil))
        }
    }
    
    //MARK: - BasicEvents methods
    func getChildsBasicEventsFromCore(childID:String, callback:([BasicEvent])->Void){
        let beFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "BasicEvent")
        beFetch.predicate = NSPredicate(format: "child.childID = %@", childID)
        let events = try! Model.instance.managedContext.fetch(beFetch)
        let e:[BasicEvent] = events as! [BasicEvent]
        callback(e)
    }
    
    //MARK: - CoreData global methods
    func saveToDB(callback:((NSError?)->Void)?){
        do{
            try Model.instance.managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
            callback?(error)
        }
        callback?(nil)
    }
    
    
    func deleteAllDataFromCore(_ entity:String) {
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: NSFetchRequest<NSFetchRequestResult>(entityName: entity))
        do {
            try managedContext.execute(DelAllReqVar)
        }
        catch {
            print(error)
        }
    }
    
    //MARK: - Images methods
    func saveImageToDisk(imageName: String, image: UIImage) {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        guard let data = image.jpegData(compressionQuality: 1) else { return }
        
        //Checks if file exists, removes it if so.
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }
        do {
            try data.write(to: fileURL)
        } catch let error {
            print("error saving file with error", error)
        }
    }
    
    func loadImageFromDiskWith(fileName: String) -> UIImage? {
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
        }
        return nil
    }
    
    func removeImageFromDisk(imageName: String){
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileName = imageName
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        if FileManager.default.fileExists(atPath: fileURL.path) {
            do {
                try FileManager.default.removeItem(atPath: fileURL.path)
                print("Removed old image")
            } catch let removeError {
                print("couldn't remove file at path", removeError)
            }
        }
    }
}

// MARK: - ModelNotification class
class ModelNotification{
    //    static let usersListNotification = MyNotification<[User]>("app.GoldenHour.usersList")
    static let childAndStaffNotification = MyNotification<(Child, Staff)>("childAndStaffNotification")
    
    class MyNotification<T>{
        let name:String
        var count = 0;
        
        init(_ _name:String) {
            name = _name
        }
        func observe(cb:@escaping (T)->Void)-> NSObjectProtocol{
            count += 1
            return NotificationCenter.default.addObserver(forName: NSNotification.Name(name),
                                                          object: nil, queue: nil) { (data) in
                                                            if let data = data.userInfo?["data"] as? T {
                                                                cb(data)
                                                            }
            }
        }
        
        func notify(data:T){
            NotificationCenter.default.post(name: NSNotification.Name(name),
                                            object: self,
                                            userInfo: ["data":data])
        }
        
        func remove(observer: NSObjectProtocol){
            count -= 1
            NotificationCenter.default.removeObserver(observer, name: nil, object: nil)
        }
        
        
    }
    
}
