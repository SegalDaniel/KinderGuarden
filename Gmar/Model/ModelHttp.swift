//
//  ModelHttp.swift
//  Gmar
//
//  Created by Daniel Segal on 15/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation

class ModelHttp{
    
    //MARK: - Child Methods
    func sendChild(child:Child, callack:@escaping (Error?)->Void){
        let session = URLSession.shared
        let url = URL(string: "http://127.0.0.1:5000/Child/newChild")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let dic = child.toJson()
        let json = dic.toJSON()
        //        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        let jsonData = json?.data(using: .utf8)
        
        
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
        }
        task.resume()
    }
    
    func getChild(childID:String, callback:@escaping (Error?, Child?)->Void){
        
    }
    
    func sendBasicEvent(basicEvent:BasicEvent, callback: @escaping(Error?) -> Void){
        
    }
    
    func sendAttandanceEvent(event:Attendance, callback: @escaping(Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "http://127.0.0.1:5000/events/AttendanceEvent")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let dic = event.toJson()
        let json = dic.toJSON()
        //        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        let jsonData = json?.data(using: .utf8)
        
        
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
        }
        task.resume()
    }
    
    
    
    func sendStaff(staff:Staff, callback: @escaping(Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "http://127.0.0.1:5000/staff")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let dic = staff.toJson()
        let json = dic.toJSON()
        //        let jsonData = try? JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
        let jsonData = json?.data(using: .utf8)
        
        
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
        }
        task.resume()
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
        }
        return "{\(out.joined(separator: ", "))}"
    }
}
