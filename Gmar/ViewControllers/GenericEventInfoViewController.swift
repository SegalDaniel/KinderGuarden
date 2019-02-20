//
//  GenericEventInfoViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GenericEventInfoViewController: GenericVC {

    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeBtn: UIButton!
    
    var isOn:[String:Bool] = [:]
    var data:[Int:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        Utility.addBorder(view: messageLabel, color: UIColor.black, width: 2)
        Utility.addBorder(view: timeLabel, color: UIColor.black, width: 2)
        timeLabel.text = currentDate()
        switch kind {
        case .feces:
            feecesDesicion()
            break
        case .solidFoods:
            break
        case .attandance:
            attandanceViews()
            break
        default:
            break
        }
    }
    
    func addToStack(stack:UIStackView, views:[UIView]){
        views.forEach { (view) in
            stack.addArrangedSubview(view)
        }
    }
    
    func addTargetToBtn(buttons:[UIButton]){
        buttons.forEach { (btn) in
            btn.addTarget(self, action: #selector(decisionBtnClicked), for: .touchUpInside)
        }
    }
    
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
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        print("confirm clicked")
        switch kind {
        case .attandance:
            performSegue(withIdentifier: "unwindToSelectKid", sender: nil)
            break
        case .feces, .solidFoods:
            performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
            break
        default:
            break
        }
        
    }
    
    @IBAction func timeBtnClicked(_ sender: Any) {
        showDatePicker(timeStyle: .short, dateStyle: .medium) { (time) in
            self.timeLabel.text = time
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToSelectKid"{
            var VCs = self.navigationController?.viewControllers
            VCs!.remove(at: VCs!.count-1)
            VCs!.remove(at: VCs!.count-1)
            self.navigationController?.setViewControllers(VCs!, animated: true)
        }
    }
    
    
    /************************************************ Generic Info Adding *****************************************************/

    func addStackForInfo(info:(Int, [String])){
        var names:[String] = info.1
        var btns:[UIButton] = []
        labelStackView.addArrangedSubview(Utility.ourLabelDesign(frame: labelStackView.frame, text: names.removeFirst()))
        for i in 0...names.count-1 {
            let tag = (info.0 * 10) + i + 1
            if tag > -1{
                btns.append(Utility.ourBtnDesign(title: names[i], radius: 1, tag: tag, image: nil, alignment: .center, type: .system))
            }
            else{
                btns.append(Utility.ourBtnDesign(title: names[i], radius: 1, tag: tag, image: nil, alignment: .center, type: .system))
                btns.forEach { (btn) in
                    btn.backgroundColor = Utility.btnSalmon
                }
            }
        }
        addTargetToBtn(buttons: btns)
        buttonStackView.addArrangedSubview(Utility.newStack(arrangedSubviews: btns))
    }
    
    
    /************************************************** Views Inits *******************************************************/
    
    func feecesDesicion(){
        addStackForInfo(info: (-1, ["צואה", "הוסף"]))
        addStackForInfo(info: (-2, ["שתן", "הוסף"]))
        isOn["poo"] = false
        isOn["pee"] = false
    }
    
    func feecesAddMissing(row:Int){
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
    
    func attandanceViews(){
        addStackForInfo(info: (1, ["", "הגעה", "עזיבה"]))
        addStackForInfo(info: (2, ["", "אבא", "אמא", "סבא"]))
        messageLabel.isHidden = true
        messageTextField.isHidden = false
    }
}
