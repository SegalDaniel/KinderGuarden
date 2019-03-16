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
    func addChild(child:Child, callack:@escaping (Error?, DocumentReference?)->Void){
        var ref: DocumentReference? = nil
        ref = db.collection("childs").addDocument(data: child.toJson(), completion: { (err) in
            if let err = err {
                print("Error adding document: \(err)")
                callack(err, ref)
            } else {
                print("Document added with ID: \(ref!.documentID)")
                callack(err, ref)
            }
        })
    }
    
    //MARK: - Remove document
    func removeDocument(docID:String, callack:@escaping (Error?)->Void){
        db.collection("users").document(docID).delete { (err) in
            callack(err)
        }
    }
    
    //******* TEST ONLY DONT USE *******
    func testUpload(callack:@escaping (Error?, DocumentReference?)->Void){
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
                callack(err, ref)
            } else {
                print("Document added with ID: \(ref!.documentID)")
                callack(err, ref)
            }
        }
    }
    
}
