//
//  ModelFireBase.swift
//  Gmar
//
//  Created by Zach Bachar on 16/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

// link to firestore documention: https://firebase.google.com/docs/firestore/manage-data/add-data?authuser=0
class ModelFireBase{
    
    let db = Firestore.firestore()
    
    
    //MARK: - Child Methods
    func sendChild(child:Child, callack:@escaping (Error?)->Void){
        db.collection("Child").document(child.childID!).setData(child.toJson(), completion: { (err) in
            callack(err)
        })
    }
    
    
    func getChild(childID:String, callback:@escaping (Error?, Child?)->Void){
        let childRef = db.collection("Child").document(childID)
        childRef.getDocument { (document, err) in
            if let child = document.flatMap({
                $0.data().flatMap({ (data) in
                    return Child(json: data)
                })
            }) {
                callback(err, child)
            } else {
                callback(err, nil)
            }
        }

    }
    
    //MARK: - Remove document - wont be needed
    func removeDocument(collection:String, docID:String, callack:@escaping (Error?)->Void){
        db.collection(collection).document(docID).delete { (err) in
            callack(err)
        }
    }
    
    //MARK: - BasicEvent Methods
    func sendBasicEvent(basicEvent:BasicEvent, callback: @escaping(Error?) -> Void){
        db.collection("BasicEvents").addDocument(data: basicEvent.toJson(), completion: callback)
    }
    
    //MARK: - Attandance Methods
    func sendAttandanceEvent(event:Attendance, callback: @escaping(Error?) -> Void){
        let childRef = db.collection("Child").document(event.child!.childID!)
        let eventID = event.eventDate!.hash
        childRef.updateData(["attendanceEvents.\(eventID)": event.toJson()])
        db.collection("AttendanceEvent").document("\(eventID)").setData(event.toJson(), completion: callback)
    }
    
    //MARK: - Staff methods
    func sendStaff(staff:Staff, callback: @escaping(Error?) -> Void){
        db.collection("Staff").document(staff.staffID!).setData(staff.toJson(), completion: callback)
    }
}
