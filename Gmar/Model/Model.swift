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
    let childEntity:NSEntityDescription
    
    private init(){
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
        childEntity = NSEntityDescription.entity(forEntityName: "Child", in: managedContext)!
    }
    
    //MARK: - Child Model Methods
    func addChild(child:Child, callack:@escaping (Error?, DocumentReference?)->Void){
        modelFirebase.addChild(child: child) { (err, ref) in
            if let ref = ref{
                child.setValue(ref.documentID, forKey: "childID")
                do {
                    try Model.instance.managedContext.save()
                    
                    let childFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Child")
                    
                    let childs = try! Model.instance.managedContext.fetch(childFetch)
                    let c:[Child] = childs as! [Child]
                    c.forEach({ (chld) in
                        print("childID: \(String(describing: chld.childID))")
                    })
                    
                } catch let error as NSError {
                    print("Could not save. \(error), \(error.userInfo)")
                }
            }
        }
    }
    
    //MARK: - Firestore methods
    func deleteDocument(docID:String, callack:@escaping (Error?)->Void){
        modelFirebase.removeDocument(docID: docID, callack: callack)
    }
    
    //MARK: - CoreData Only
    func deleteAllData(_ entity:String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        fetchRequest.returnsObjectsAsFaults = false
        do
        {
            let results = try Model.instance.managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                Model.instance.managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(entity) error : \(error) \(error.userInfo)")
        }
    }
    
    //******* TEST ONLY DONT USE *******
    func testFirestoreDB(callack:@escaping (Error?, DocumentReference?)->Void){
        modelFirebase.testUpload(callack: callack)
    }
}
