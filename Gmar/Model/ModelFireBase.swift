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
//        let session = URLSession.shared
//        let url = URL(string: "http://127.0.0.1:5000/alerts/LogicSystemAlert/1")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
////        let json = child.toJson()
//        let jsonData = try? JSONSerialization.data(withJSONObject: child.toJson(), options: [.prettyPrinted])
//
//
//        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
//            // Do something...
//                        if error != nil || data == nil {
//                            print("Client error!")
//                            return
//                        }
//
//                        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                            print("Server error!")
//                            return
//                        }
//        }
//
//        task.resume()
        
        //        let task = session.dataTask(with: url) { data, response, error in
        //
        //            if error != nil || data == nil {
        //                print("Client error!")
        //                return
        //            }
        //
        //            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
        //                print("Server error!")
        //                return
        //            }
        //
        //            guard let mime = response.mimeType, mime == "application/json" else {
        //                print("Wrong MIME type!")
        //                return
        //            }
        //
        //            do {
        //                let json = try JSONSerialization.jsonObject(with: data!, options: [])
        //                print(json)
        //            } catch {
        //                print("JSON error: \(error.localizedDescription)")
        //            }
        //        }
        //
        //        task.resume()
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
//        let session = URLSession.shared
//        let url = URL(string: "http://127.0.0.1:5000/events/SoidFood")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        let dic = basicEvent.toJson()
//        let json = dic.toJSON()
////        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
//        let jsonData = json?.data(using: .utf8)
//
//
//        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
//            // Do something...
//            if error != nil || data == nil {
//                print("Client error!")
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
//                print("Server error!")
//                return
//            }
//        }
//
//        task.resume()
//    }
    
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

protocol JSONSerializable {
    func toJSON() -> String?
}
extension String : JSONSerializable {
    func toJSON() -> String? {
        return "\"\(self)\""
    }
}
extension Dictionary : JSONSerializable {
    func toJSON() -> String? {
        var out : [String] = []
        for (k, v) in self {
            if let json_element = v as? JSONSerializable, let string = json_element.toJSON() {
                out.append("\"\(k)\": \(string)")
            }
//            else {
//                return nil
//            }
        }
        return "{\(out.joined(separator: ", "))}"
    }
}
