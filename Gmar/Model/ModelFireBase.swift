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
import FirebaseAuth

// link to firestore documention: https://firebase.google.com/docs/firestore/manage-data/add-data?authuser=0
class ModelFireBase{
    
    let db = Firestore.firestore()
    
    //MARK: - Authentication FireBase
    func signIn(mail:String  ,pass:String, callback:@escaping (AuthDataResult?, Error?)->Void){
        Auth.auth().signIn(withEmail: mail, password: pass) { (user, error) in
            if user != nil{
                callback(user, error)
            }else{
                callback(user, error)
            }
        }
    }
    
    func checkIfSignIn()->Bool{
        return (Auth.auth().currentUser != nil)
    }
    
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
        let childRef = db.collection("Child").document(basicEvent.child!.childID!)
        let eventID = basicEvent.eventDate!.hash
        let staffRef = db.collection("Staff").document(basicEvent.staff!.staffID!)
        childRef.updateData(["basicEvents.\(eventID)\(basicEvent.eventType)": basicEvent.toJson()]) { (err) in
            staffRef.updateData(["basicEvents.\(eventID)\(basicEvent.eventType)": basicEvent.toJson()], completion: { (err) in
                self.db.collection("BasicEvents").document("\(eventID)\(basicEvent.eventType)").setData(basicEvent.toJson(), completion: callback)
            })
        }
    }
    
    //MARK: - Attandance Methods
    func sendAttandanceEvent(event:Attendance, callback: @escaping(Error?) -> Void){
        let childRef = db.collection("Child").document(event.child!.childID!)
        let eventID = event.eventDate!.hash
        let staffRef = db.collection("Staff").document(event.staff!.staffID!)
        childRef.updateData(["attendanceEvents.\(eventID)": event.toJson()])
        staffRef.updateData(["basicEvents.\(eventID)": event.toJson()])
        db.collection("AttendanceEvent").document("\(eventID)").setData(event.toJson(), completion: callback)
    }
    
    //MARK: - Staff methods
    func sendStaff(staff:Staff, callback: @escaping(Error?) -> Void){
        db.collection("Staff").document(staff.staffID!).setData(staff.toJson(), completion: callback)
    }
}
