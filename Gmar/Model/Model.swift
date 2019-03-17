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
    
    static let instance:Model = Model()
    var modelFirebase = ModelFireBase()

    let appDelegate:AppDelegate
    let managedContext:NSManagedObjectContext
    let staffEntity:NSEntityDescription
    let childEntity:NSEntityDescription
    let sleepEntity:NSEntityDescription
    let feverEntity:NSEntityDescription
    
    private init(){
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        staffEntity = NSEntityDescription.entity(forEntityName: "Staff", in: managedContext)!
        childEntity = NSEntityDescription.entity(forEntityName: "Child", in: managedContext)!
        sleepEntity = NSEntityDescription.entity(forEntityName: "Sleep", in: managedContext)!
        feverEntity = NSEntityDescription.entity(forEntityName: "Fever", in: managedContext)!
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
}
