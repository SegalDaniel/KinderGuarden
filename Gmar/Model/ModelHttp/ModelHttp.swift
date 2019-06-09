//
//  ModelHttp.swift
//  Gmar
//
//  Created by Daniel Segal on 15/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation

class ModelHttp{
    
    let server = "http://193.106.55.183"
    
    
    //MARK: - Child Methods
    func sendChild(child:Child, callback:@escaping (Error?)->Void){
        let session = URLSession.shared
        let url = URL(string: "\(server)/Child/newChild")! //http://193.106.55.183/Child/newChild
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = child.toJson()
        let json = dic.toJSON()
        let jsonData = json?.data(using: .utf8)
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                callback(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                callback(HttpError())
                return
            }
            callback(nil)
        }
        task.resume()
    }
    
    func getChildren(callback:([Child])->Void){
        let url = URL(string: "\(server)/Child")!
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
    
    func deleteChild(childID:String, callback:@escaping (Error?)->Void){
        let firstTodoEndpoint: String = "http://193.106.55.183/Child/\(childID)"
        var firstTodoUrlRequest = URLRequest(url: URL(string: firstTodoEndpoint)!)
        firstTodoUrlRequest.httpMethod = "DELETE"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: firstTodoUrlRequest) {
            (data, response, error) in
            guard let _ = data else {
                print("error calling DELETE on Child")
                callback(HttpError())
                return
            }
            print("DELETE ok")
            callback(nil)
        }
        task.resume()
    }
    
    //MARK: - Basic Events
    func sendBasicEvent(basicEvent:BasicEvent, callback: @escaping(Error?) -> Void){
        let kind:Enums.BasicEvent = Enums.BasicEvent(rawValue: Int(basicEvent.eventType))!
        var url=URL(string: "empty")!
        switch kind {
        case .attandance:
            url = URL(string: "\(server)/events/AttendanceEvent/newEvent")!
            break
        case .sleep:
            url = URL(string: "\(server)/events/SleepingEvent/newEvent")!
            break
        case .water:
            url = URL(string: "\(server)/events/WaterEvent/newEvent")!
            break
        case .solidFoods:
            url = URL(string: "\(server)/events/SolidFoodEvent/newEvent")!
            break
        case .tamal, .milk:
            url = URL(string: "\(server)/events/LiquidFoodEvent/newEvent")!
            break
        case .feces:
            url = URL(string: "\(server)/events/FecesEvent/newEvent")!
            break
        case .urine:
            url = URL(string: "\(server)/events/UrineEvent/newEvent")!
            break
        case .cough:
            url = URL(string: "\(server)/events/CoughEvent/newEvent")!
            break
        case .hafrahsa:
            url = URL(string: "\(server)/events/SecretionEvent/newEvent")!
            break
        case .vomit:
            url = URL(string: "\(server)/events/VomitusEvent/newEvent")!
            break
        case .rash:
            url = URL(string: "\(server)/events/RashEvent/newEvent")!
            break
        case .feever:
            url = URL(string: "\(server)/events/FeverEvent/newEvent")!
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
                callback(error)
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                callback(HttpError())
                return
            }
            callback(nil)
        }
        task.resume()
    }
    
    func getBasicEventsByID(childID:String, callback:@escaping ([BasicEvent]) -> Void){
        let url = URL(string: "\(server)/Child/GetEventsByChildID/\(childID)")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: dataResponse, options: []) as! NSDictionary
                self.parseBasicEvent(jsonResponse: jsonResponse)
            
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func deleteBasicEvent(eventID:String, kind:Enums.BasicEvent, callback:@escaping (Error?) -> Void){
        var firstTodoEndpoint: String = "empty"
        switch kind {
        case .attandance:
            firstTodoEndpoint = "\(server)/events/AttendanceEvent/\(eventID)"
            break
        case .sleep:
            firstTodoEndpoint = "\(server)/events/SleepingEvent/\(eventID)"
            break
        case .water:
            firstTodoEndpoint = "\(server)/events/WaterEvent/\(eventID)"
            break
        case .solidFoods:
            firstTodoEndpoint = "\(server)/events/SolidFoodEvent/\(eventID)"
            break
        case .tamal, .milk:
            firstTodoEndpoint = "\(server)/events/LiquidFoodEvent/\(eventID)"
            break
        case .feces:
            firstTodoEndpoint = "\(server)/events/FecesEvent/\(eventID)"
            break
        case .urine:
            firstTodoEndpoint = "\(server)/events/UrineEvent/\(eventID)"
            break
        case .cough:
            firstTodoEndpoint = "\(server)/events/CoughEvent/\(eventID)"
            break
        case .hafrahsa:
            firstTodoEndpoint = "\(server)/events/SecretionEvent/\(eventID)"
            break
        case .vomit:
            firstTodoEndpoint = "\(server)/events/VomitusEvent/\(eventID)"
            break
        case .rash:
            firstTodoEndpoint = "\(server)/events/RashEvent/\(eventID)"
            break
        case .feever:
            firstTodoEndpoint = "\(server)/events/FeverEvent/\(eventID)"
            break
        default:
            break
        }
        var firstTodoUrlRequest = URLRequest(url: URL(string: firstTodoEndpoint)!)
        firstTodoUrlRequest.httpMethod = "DELETE"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: firstTodoUrlRequest) {
            (data, response, error) in
            guard let _ = data else {
                print("error calling DELETE on Child")
                callback(HttpError())
                return
            }
            print("DELETE ok")
            callback(nil)
        }
        task.resume()
    }
    
    //MARK: - Developmental Events
    func sendDevelopmentEvent(developmentEvent: DevelopmentalEvent, callback:@escaping (Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "\(server)/events/DevelopmentalEvent/newEvent")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = developmentEvent.toJson()
        let json = dic.toJSON()
        let jsonData = json?.data(using: .utf8)
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                callback(error)
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                callback(HttpError())
                return
            }
            callback(nil)
        }
        task.resume()
    }
    
    func getDevelopmentalEvents(childID:String, callback:@escaping ([DevelopmentalEvent]) -> Void){
        let url = URL(string: "\(server)/events/DevelopmentalEventByChildId/\(childID)")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: []) as! NSDictionary
                let jsonArr = jsonResponse["developmentalEvent"]! as! NSArray
                var events:[DevelopmentalEvent] = []
                
                callback(events)
              
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func deleteDevelopmentalEvent(event:DevelopmentalEvent, callback:@escaping (Error?)->Void){
        let firstTodoEndpoint: String = "http://193.106.55.183/events/DevelopmentalEvent/\(event.eventID!)"
        var firstTodoUrlRequest = URLRequest(url: URL(string: firstTodoEndpoint)!)
        firstTodoUrlRequest.httpMethod = "DELETE"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: firstTodoUrlRequest) {
            (data, response, error) in
            guard let _ = data else {
                print("error calling DELETE on Dev Event")
                callback(HttpError())
                return
            }
            print("DELETE ok")
            callback(nil)
        }
        task.resume()
    }
    
    //MARK: - Staff
    func sendStaff(staff:Staff, callback: @escaping(Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "\(server)/staff/newStaff")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = staff.toJson()
        let json = dic.toJSON()
        let jsonData = json?.data(using: .utf8)
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                callback(error)
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                callback(HttpError())
                return
            }
            callback(nil)
        }
        task.resume()
    }
    
    
    //MARK: - Family Report
    func sendFamilyReport(familyReport:FamilyReport, callback: @escaping(Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "\(server)/events/FamilyReportEvent/newEvent")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = familyReport.toJson()
        let json = dic.toJSON()
        let jsonData = json?.data(using: .utf8)
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                callback(error)
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                callback(HttpError())
                return
            }
            callback(nil)
        }
        task.resume()
    }
    
    //MARK: - General Notes
    func sendGeneralNote(generalNote:GeneralNote, callback: @escaping(Error?) -> Void){
        let session = URLSession.shared
        let url = URL(string: "\(server)/events/GeneralNoteEvent/newEvent")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let dic = generalNote.toJson()
        let json = dic.toJSON()
        let jsonData = json?.data(using: .utf8)
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            if error != nil || data == nil {
                print("Client error!")
                callback(error)
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                callback(HttpError())
                return
            }
            callback(nil)
        }
        task.resume()
    }
    
    //MARK: - Alerts
    func getAlerts(callback:@escaping ()->Void){
        let url = URL(string: "\(server)/alerts/Alerts")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: []) as! NSDictionary
                if let jsonArr = jsonResponse["Alert"] as? NSArray{
                    var alerts:[Alert] = []
                    Model.instance.getAlertsFromCoreData(callback: { (oldAlerts) in
                        jsonArr.forEach({ (jsonAlert) in
                            var exist = false
                            let jAlert = jsonAlert as! [String:Any]
                            oldAlerts.forEach({ (oldAlert) in
                                if oldAlert == jAlert{
                                    exist = true
                                }
                            })
                            if !exist{
                                Model.instance.getAllChildsFromCore(callback: { (childs) in
                                    childs.forEach({ (child) in
                                        if child.childID == (jAlert["childID"] as! String){
                                            exist = true
                                        }
                                    })
                                })
                                if exist{
                                    alerts.append(Alert(json: jAlert))
                                    Model.instance.saveToDB(callback: nil)
                                }
                            }
                        })
                        callback()
                    })
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    

    func getPulseAlert(callback: @escaping (String)->Void){
        let url = URL(string: "\(server)/alerts/PulseAlerts")! //change to one alert ar Server
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataResponse = data,
                error == nil else {
                    print(error?.localizedDescription ?? "Response Error")
                    return }
            do{
                //here dataResponse received from a network request
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    dataResponse, options: []) as! NSDictionary
                let pulseArr = jsonResponse["pulseAlert"]! as! NSArray
                if let pulseObj = pulseArr.firstObject as? NSDictionary{
                    let pulse = Int(truncating: pulseObj["pulse"] as! NSNumber)
                    callback(String(pulse))
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
    func deleteAlert(alert:Alert, callback:@escaping (Error?)->Void){
        let firstTodoEndpoint: String = "http://193.106.55.183/alerts/\(alert.alertID!)"
        var firstTodoUrlRequest = URLRequest(url: URL(string: firstTodoEndpoint)!)
        firstTodoUrlRequest.httpMethod = "DELETE"
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: firstTodoUrlRequest) {
            (data, response, error) in
            guard let _ = data else {
                print("error calling DELETE on Alert")
                callback(HttpError())
                return
            }
            print("DELETE ok")
            callback(nil)
        }
        task.resume()
    }
}

//MARK: - JSON
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

//MARK: - URL Session extension
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
