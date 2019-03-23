//
//  Model.swift
//  Gmar
//
//  Created by Zach Bachar on 16/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import FirebaseFirestore
import CoreData

class Model{
    //MARK: - Variables
    static let instance:Model = Model()
    var modelFirebase = ModelFireBase()
    let appDelegate:AppDelegate
    let managedContext:NSManagedObjectContext
    
    //MARK: - NSEnteties
    let staffEntity:NSEntityDescription
    let childEntity:NSEntityDescription
    let sleepEntity:NSEntityDescription
    let feverEntity:NSEntityDescription
    let rashEntity:NSEntityDescription
    let liquidFoodEntity:NSEntityDescription
    let solidFoodEntity:NSEntityDescription
    let waterEntity:NSEntityDescription
    let fecesEntity:NSEntityDescription
    let urineEntity:NSEntityDescription
    let vomitusEntity:NSEntityDescription
    let authorizedAccompanistEntity:NSEntityDescription
    let medicationEntity:NSEntityDescription
    let diseaseEntity:NSEntityDescription
    let attendanceEntity:NSEntityDescription
    let coughEntity:NSEntityDescription
    let parasitesEntity:NSEntityDescription
    let secretionEntity:NSEntityDescription
    
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
    }
    
    //MARK: - Child Model Methods
    func addChild(child:Child, callack:@escaping (Error?)->Void){
        modelFirebase.addChild(child: child) { (err) in
            if err == nil{
                do {
                    try Model.instance.managedContext.save()
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
            callack(err)
        }
    }
    
    func getChild(childID:String, callback:@escaping (Error?, Child?)->Void){
        modelFirebase.getChild(childID: childID, callback: callback)
    }
    
    //MARK: - Firestore methods
    func deleteDocument(docID:String, callack:@escaping (Error?)->Void){
        modelFirebase.removeDocument(docID: docID, callack: callack)
    }
    
    //MARK: - CoreData Only
    func getAllChildsFromCore(callback:([Child])->Void){
        let childFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Child")
        let childs = try! Model.instance.managedContext.fetch(childFetch)
        let c:[Child] = childs as! [Child]
        callback(c)
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
