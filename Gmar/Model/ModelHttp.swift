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
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
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
        let session = URLSession.shared
        let url = URL(string: "http://127.0.0.1:5000/Child")!
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                print("Client error!")
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
            guard let mime = response.mimeType, mime == "application/json" else {
                print("Wrong MIME type!")
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        
        task.resume()
    }
    
    func sendBasicEvent(basicEvent:BasicEvent, callback: @escaping(Error?) -> Void){
        let kind:Enums.BasicEvent = Enums.BasicEvent(rawValue: Int(basicEvent.eventType))!
        var url=URL(string: "empty")!
        switch kind {
        case .sleep:
            url = URL(string: "http://127.0.0.1:5000/events/SleepingEvent/newEvent")!
            break
        case .water:
            url = URL(string: "http://127.0.0.1:5000/events/WaterEvent/newEvent")!
            break
        case .solidFoods:
            url = URL(string: "http://127.0.0.1:5000/events/SolidFoodEvent/newEvent")!
            break
        case .tamal, .milk:
            url = URL(string: "http://127.0.0.1:5000/events/LiquidFoodEvent/newEvent")!
            break
        case .feces:
            url = URL(string: "http://127.0.0.1:5000/events/FecesEvent/newEvent")!
            break
        case .urine:
            url = URL(string: "http://127.0.0.1:5000/events/UrineEvent/newEvent")!
            break
        case .cough:
            url = URL(string: "http://127.0.0.1:5000/events/CoughEvent/newEvent")!
            break
        case .hafrahsa:
            url = URL(string: "http://127.0.0.1:5000/events/SecretionEvent/newEvent")!
            break
        case .vomit:
            url = URL(string: "http://127.0.0.1:5000/events/VomitusEvent/newEvent")!
            break
        case .rash:
            url = URL(string: "http://127.0.0.1:5000/events/RashEvent/newEvent")!
            break
        case .feever:
            url = URL(string: "http://127.0.0.1:5000/events/FeverEvent/newEvent")!
            break
            //add parasites medication and disease
        //add liquid food url
        default:
            break
        }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = basicEvent.toJson()
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
    
    func sendAttandanceEvent(event:Attendance, callback: @escaping(Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "http://127.0.0.1:5000/events/AttendanceEvent")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //        request.addValue("application/json", forHTTPHeaderField: "Accept")
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
extension Int : JSONSerializable {
    func toJSON() -> String? {
        return "\(self)"
    }
}

extension Double : JSONSerializable {
    func toJSON() -> String? {
        return "\(self)"
    }
}

extension Dictionary : JSONSerializable {
    func toJSON() -> String? {
        var out : [String] = []
        for (k, v) in self {
            
            if k as! String == "eventID"{
                let numericString = "\(String(describing: v))"
                out.append("\"\(k)\": \"\(numericString)\"")
            }
            
            
            else if let json_element = v as? JSONSerializable, let string = json_element.toJSON() {
                out.append("\"\(k)\": \(string)")
            }
            else {
                let numericString = "\(String(describing: v))"
                out.append("\"\(k)\": \"\(numericString)\"")
            }
        }
        return "{\(out.joined(separator: ", "))}"
    }
}
