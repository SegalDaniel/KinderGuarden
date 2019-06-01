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
        let url = URL(string: "http://193.106.55.183/Child/newChild")! //http://193.106.55.183/Child/newChild
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = child.toJson()
        let json = dic.toJSON()
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
    
    func getChildren(callback:([Child])->Void){
        let url = URL(string: "http://193.106.55.183/Child")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func sendBasicEvent(basicEvent:BasicEvent, callback: @escaping(Error?) -> Void){
        let kind:Enums.BasicEvent = Enums.BasicEvent(rawValue: Int(basicEvent.eventType))!
        var url=URL(string: "empty")!
        switch kind {
        case .attandance:
            url = URL(string: "http://193.106.55.183/events/AttendanceEvent/newEvent")!
            break
        case .sleep:
            url = URL(string: "http://193.106.55.183/events/SleepingEvent/newEvent")!
            break
        case .water:
            url = URL(string: "http://193.106.55.183/events/WaterEvent/newEvent")!
            break
        case .solidFoods:
            url = URL(string: "http://193.106.55.183/events/SolidFoodEvent/newEvent")!
            break
        case .tamal, .milk:
            url = URL(string: "http://193.106.55.183/events/LiquidFoodEvent/newEvent")!
            break
        case .feces:
            url = URL(string: "http://193.106.55.183/events/FecesEvent/newEvent")!
            break
        case .urine:
            url = URL(string: "http://193.106.55.183/events/UrineEvent/newEvent")!
            break
        case .cough:
            url = URL(string: "http://193.106.55.183/events/CoughEvent/newEvent")!
            break
        case .hafrahsa:
            url = URL(string: "http://193.106.55.183/events/SecretionEvent/newEvent")!
            break
        case .vomit:
            url = URL(string: "http://193.106.55.183/events/VomitusEvent/newEvent")!
            break
        case .rash:
            url = URL(string: "http://193.106.55.183/events/RashEvent/newEvent")!
            break
        case .feever:
            url = URL(string: "http://193.106.55.183/events/FeverEvent/newEvent")!
            break
        default:
            break
        }
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = basicEvent.toJson()
        let json = dic.toJSON()
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
    
    func getBasicEventsByID(childID:String, callback:(Child)->Void){
        let url = URL(string: "http://193.106.55.183/events/" + String(childID.hashValue))!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func sendDevelopmentEvent(developmentEvent: DevelopmentalEvent, callack:@escaping (Error?)->Void){
        let session = URLSession.shared
        let url = URL(string: "http://193.106.55.183/events/DevelopmentalEvent/newEvent")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = developmentEvent.toJson()
        let json = dic.toJSON()
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
        let url = URL(string: "http://193.106.55.183/staff/newStaff")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = staff.toJson()
        let json = dic.toJSON()
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
    
    func sendFamilyReport(familyReport:FamilyReport, callback: @escaping(Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "http://193.106.55.183/events/FamilyReportEvent/newEvent")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = familyReport.toJson()
        let json = dic.toJSON()
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
    
    func sendGeneralNote(generalNote:GeneralNote, callback: @escaping(Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "http://193.106.55.183/events/GeneralNoteEvent/newEvent")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = generalNote.toJson()
        let json = dic.toJSON()
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
    
    func getAlerts(callback:([Alert])->Void){
        let url = URL(string: "http://193.106.55.183/alerts")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }

    func getPulseAlert(callback:([Alert])->Void){
        let url = URL(string: "http://193.106.55.183/alerts/alerts/PulseAlerts")! //change to one alert ar Server
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: [])
                print(jsonResponse) //Response result
            } catch let parsingError {
                print("Error", parsingError)
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

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((response, data)))
        }
    }
}
