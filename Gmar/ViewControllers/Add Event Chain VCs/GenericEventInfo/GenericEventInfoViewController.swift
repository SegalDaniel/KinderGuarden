//
//  GenericEventInfoViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GenericEventInfoViewController: GenericVC {
    
    //MARK: - Variables
    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var timeBtn: UIButton!
    @IBOutlet weak var titleItem: UINavigationItem!
    
    var isOn:[String:Bool] = [:]
    var data:[Int:String] = [:]
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        //addConfirmButton(selector: #selector(confirmBtnClicked))
        timeBtn.setTitle(currentDate(), for: .normal)
        switch kind {
        case .feces:
            feecesDesicion()
            break
        case .solidFoods:
            solidFoodViews()
            break
        case .attandance:
            attandanceViews()
            break
        case .vomit:
            vomitViews()
            break
        case .sleep:
            sleepViews()
            break
        case .rash:
            rashViews()
            break
        case .cough:
            coughViews()
            break
        case .hafrahsa:
            hafrashaViews()
            break
        default:
            break
        }
    }
    
    /*************************   user interface events **********************************************/
    //MARK: - buttons actions
    @IBAction func decisionBtnClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            let row = (btn.tag / 10) - 1
            if row > -1{
                let label = labelStackView.arrangedSubviews[row] as! UILabel
                label.text = btn.titleLabel?.text
                data[row] = label.text!
            }
            // only on .feces kind
            else{
                for view in labelStackView.subviews{
                    view.removeFromSuperview()
                }
                for view in buttonStackView.subviews{
                    view.removeFromSuperview()
                }
                feecesAddMissing(row: row)
            }
        }
    }
    
    
    
    @IBAction func timeBtnClicked(_ sender: Any) {
        showDatePicker(timeStyle: .short, dateStyle: .medium) { (dateString, time, date) in
            self.timeBtn.setTitle(dateString, for: .normal)
        }
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToSelectKid"{
            let viewControllers:[UIViewController] = [self.navigationController!.viewControllers[0], self.navigationController!.viewControllers[1]]
           self.navigationController?.setViewControllers(viewControllers, animated: true)
        }
    }
    
    //MARK: - Generic info adding
    func addStackForInfo(info:(Int, [String])){
        var names:[String] = info.1
        var btns:[UIButton] = []
        labelStackView.addArrangedSubview(Utility.ourLabelDesign(frame: labelStackView.frame, text: names.removeFirst()))
        for i in 0...names.count-1 {
            let tag = (info.0 * 10) + i + 1
            if tag > -1{
                let btn = MyButtonView(frame: .zero)
                btns.append(Utility.ourBtnDesign(title: names[i], radius: 10, tag: tag, image: nil, alignment: .center, type: .system))
            }
            else{
                btns.append(Utility.ourBtnDesign(title: names[i], radius: 10, tag: tag, image: nil, alignment: .center, type: .system))
                btns.forEach { (btn) in
                    btn.backgroundColor = Utility.btnSalmon
                }
            }
        }
        addTargetToBtn(buttons: btns)
        buttonStackView.addArrangedSubview(Utility.newStack(arrangedSubviews: btns))
    }
    
    func addToStack(stack:UIStackView, views:[UIView]){
        views.forEach { (view) in
            stack.addArrangedSubview(view)
        }
    }
    
    func addTargetToBtn(buttons:[UIButton]){
        buttons.forEach { (btn) in
            btn.addTarget(self, action: #selector(decisionBtnClicked), for: .touchUpInside)
            newButtonShadowAdjust(button: btn)
        }
    }
    
    //MARK: - Views Inits
    //MARK: - feeces
    func feecesDesicion(){
        titleItem.title = "דיווח צרכים"
        addStackForInfo(info: (-1, ["צואה", "הוסף"]))
        addStackForInfo(info: (-2, ["שתן", "הוסף"]))
        isOn["poo"] = false
        isOn["pee"] = false
    }
    
    func feecesAddMissing(row:Int){
        titleItem.title = "דיווח צרכים"
        if row == -1{
            isOn["poo"] = true
            addStackForInfo(info: (1, ["צבע", "חום/צהוב/ירוק", "אדום", "לבן/אפור"]))
            addStackForInfo(info: (2, ["מרקם", "משחתי/חלק", "יבש/גללי", "שלשול/מיימי", "ריירי"]))
            addStackForInfo(info: (3, ["כמות", "קטנה", "רגילה", "חיתול מלא"]))
            if isOn["pee"]!{
                addStackForInfo(info: (4, ["צבע שתן", "צהוב בהיר", "צהוב כהה/חום", "אדום"]))
                addStackForInfo(info: (5, ["ריח שתן", "רגיל", "חריף"]))
                addStackForInfo(info: (6, ["כמות שתן", "רגילה", "חיתול מלא"]))
                data.forEach { (row,value) in
                    (labelStackView.arrangedSubviews[row+2] as! UILabel).text = value
                }
            }
            else { addStackForInfo(info: (-2, ["שתן", "הוסף"]))}
            
        }
        else{
            isOn["pee"] = true
            if isOn["poo"]!{
                addStackForInfo(info: (1, ["צבע", "חום/צהוב/ירוק", "אדום", "לבן/אפור"]))
                addStackForInfo(info: (2, ["מרקם", "משחתי/חלק", "יבש/גללי", "שלשול/מיימי", "ריירי"]))
                addStackForInfo(info: (3, ["כמות", "קטנה", "רגילה", "חיתול מלא"]))
                addStackForInfo(info: (4, ["צבע שתן", "צהוב בהיר", "צהוב כהה/חום", "אדום"]))
                addStackForInfo(info: (5, ["ריח שתן", "רגיל", "חריף"]))
                addStackForInfo(info: (6, ["כמות שתן", "רגילה", "חיתול מלא"]))
                data.forEach { (row,value) in
                    (labelStackView.arrangedSubviews[row] as! UILabel).text = value
                }
            }
            else {
                addStackForInfo(info: (-1, ["צואה", "הוסף"]))
                addStackForInfo(info: (2, ["צבע שתן", "צהוב בהיר", "צהוב כהה/חום", "אדום"]))
                addStackForInfo(info: (3, ["ריח שתן", "רגיל", "חריף"]))
                addStackForInfo(info: (4, ["כמות שתן", "רגילה", "חיתול מלא"]))
            }
        }
    }
    
    //MARK: - attandance
    func attandanceViews(){
        titleItem.title = "דיווח נוכחות"
        var authorizedData:[String] = ["מלווה"]
        if let child = child{
            if child.isAttend{
                addStackForInfo(info: (1, ["עזיבה", "עזיבה"]))
            }
            else{
                addStackForInfo(info: (1, ["הגעה", "הגעה"]))
            }
            
            child.authorized?.forEach({ (auth) in
                let auth = auth as! AuthorizedAccompanist
                authorizedData.append("\(auth.relation!) \(auth.name!)")
            })
        }
        addStackForInfo(info: (2, authorizedData))
    }
    
    //MARK: - vomits
    func vomitViews(){
        titleItem.title = "דיווח הקאה"
        addStackForInfo(info: (1, ["סוג", "פליטה מוגברת", "הקאה"]))
        addStackForInfo(info: (2, ["חומרה", "תקין", "לא תקין"]))
    }
    
    //MARK: - solid food
    func solidFoodViews(){
        titleItem.title = "דיווח האכלה"
        let currentTime = DateAdmin.currentTime(timeStyle: .short)
        let currentHour = Int(currentTime.split(separator: ":")[0])!
        if currentHour < 12{
            addStackForInfo(info: (1, ["ארוחת בוקר", "ארוחת בוקר", "ארוחת צהריים"]))
        }
        else{
           addStackForInfo(info: (1, ["ארוחת צהריים", "ארוחת בוקר", "ארוחת צהריים"]))
        }
        addStackForInfo(info: (2, ["כמות", "סיים מנה", "מעל חצי מנה", "מתחת לחצי מנה", "לא אכל"]))
    }
    
    //MARK: - sleep
    func sleepViews(){
        titleItem.title = "דיווח שינה"
        let currentTime = DateAdmin.currentTime(timeStyle: .short)
        let currentHour = Int(currentTime.split(separator: ":")[0])!
        if currentHour < 12{
            addStackForInfo(info: (1, ["שנת בוקר", "שנת בוקר", "שנת צהריים"]))
        }
        else{
            addStackForInfo(info: (1, ["שנת צהריים", "שנת בוקר", "שנת צהריים"]))
        }
        addStackForInfo(info: (2, ["אורך השינה", "שינה מלאה", "שינה חלקית", "אי שינה"]))
        addStackForInfo(info: (3, ["איכות השינה", "שקטה", "לא שקטה"]))
    }
    
    //MARK: - rash
    func rashViews(){
        titleItem.title = "דיווח פריחה"
        addStackForInfo(info: (1, ["סוג", "פריחה/אדמומיות", "פצעים/פצעונים", "כתמים"]))
        addStackForInfo(info: (2, ["איזור", "פנים", "פה", "גפיים", "טוסיק", "גב", "חזה/בטן", "איבר מין", "ראש", "עיניים"]))
    }
    
    //MARK: - cough
    func coughViews(){
        titleItem.title = "דיווח שיעול"
        addStackForInfo(info: (1, ["סוג", "צפצופי נשימה", "קוצר נשימה", "טורדני", "לח"]))
    }
    
    //MARK: - hafrasha
    func hafrashaViews(){
        titleItem.title = "דיווח הפרשה"
        addStackForInfo(info: (1, ["סוג", "דם", "מוגלה", "נזלת"]))
        addStackForInfo(info: (2, ["איזור", "עיניים", "אוזניים", "אף", "פה", "איבר מין", "שאר הגוף"]))
        addStackForInfo(info: (3, ["חומרה", "תקין", "לא תקין"]))
    }
}
