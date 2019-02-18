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
            fecesViews()
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
            let label = labelStackView.arrangedSubviews[row] as! UILabel
            label.text = btn.titleLabel?.text
        }
    }
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        print("confirm clicked")
        performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
    }
    
    @IBAction func timeBtnClicked(_ sender: Any) {
        showDatePicker { (time) in
            self.timeLabel.text = time
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    /************************************************ Generic Info Adding *****************************************************/

    func addStackForInfo(info:(Int, [String])){
        var names:[String] = info.1
        var btns:[UIButton] = []
        labelStackView.addArrangedSubview(Utility.ourLabelDesign(frame: labelStackView.frame, text: names.removeFirst()))
        for i in 0...names.count-1 {
            let tag = (info.0 * 10) + i + 1
            btns.append(Utility.ourBtnDesign(title: names[i], radius: 1, tag: tag, image: nil, alignment: .center, type: .system))
        }
        addTargetToBtn(buttons: btns)
        buttonStackView.addArrangedSubview(Utility.newStack(arrangedSubviews: btns))
    }
    
    
    /************************************************** Views Inits *******************************************************/
    
    func fecesViews(){
        addStackForInfo(info: (1, ["צבע", "חום/צהוב/ירוק", "אדום", "לבן/אפור"]))
        addStackForInfo(info: (2, ["מרקם", "משחתי/חלק", "יבש/גללי", "שלשול/מיימי", "ריירי"]))
        addStackForInfo(info: (3, ["כמות", "קטנה", "רגילה", "חיתול מלא"]))
        addStackForInfo(info: (4, ["צבע שתן", "צהוב בהיר", "צהוב כהה/חום", "אדום"]))
        addStackForInfo(info: (5, ["ריח שתן", "רגיל", "חריף"]))
        addStackForInfo(info: (6, ["כמות שתן", "רגילה", "חיתול מלא"]))
        
        messageLabel.text = "ניתן למלא או צואה או שתן או שניהם*"
    }
    
    func attandanceViews(){
        addStackForInfo(info: (1, ["", "הגעה", "עזיבה"]))
        addStackForInfo(info: (2, ["", "אבא", "אמא", "סבא"]))
        messageLabel.isHidden = true
        messageTextField.isHidden = false
    }
}
