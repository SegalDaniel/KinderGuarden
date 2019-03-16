//
//  Model.swift
//  Gmar
//
//  Created by Zach Bachar on 16/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import FirebaseFirestore

class Model{
    
    static let instance:Model = Model()
    var modelFirebase = ModelFireBase()
    
    private init(){
        
    }
    
    //MARK: - Firestore methods
    func deleteDocument(docID:String, callack:@escaping (Error?)->Void){
        modelFirebase.removeDocument(docID: docID, callack: callack)
    }
    
    //******* TEST ONLY DONT USE *******
    func testFirestoreDB(callack:@escaping (Error?, DocumentReference?)->Void){
        modelFirebase.testUpload(callack: callack)
    }
}
