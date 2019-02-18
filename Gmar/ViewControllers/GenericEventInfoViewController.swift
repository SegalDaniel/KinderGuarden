//
//  GenericEventInfoViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GenericEventInfoViewController: UIViewController {

    @IBOutlet weak var labelStackView: UIStackView!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    var kind:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
       
    }
    
    func initViews(){
        switch kind {
        case 1:
            fecesViews()
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
            print("row: \(row) text:\(String(describing: btn.titleLabel!.text))")
        }
    }
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        print("confirm clicked")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    /************************************************** Views Inits *******************************************************/
    
    func fecesViews(){
        let l1 = Utility.ourLabelDesign(frame: labelStackView.frame, text: "צבע")
        let l2 = Utility.ourLabelDesign(frame: labelStackView.frame, text: "מרקם")
        let l3 = Utility.ourLabelDesign(frame: labelStackView.frame, text: "כמות")
        let l4 = Utility.ourLabelDesign(frame: labelStackView.frame, text: "צבע שתן")
        let l5 = Utility.ourLabelDesign(frame: labelStackView.frame, text: "ריח שתן")
        let l6 = Utility.ourLabelDesign(frame: labelStackView.frame, text: "כמות שתן")
        addToStack(stack: labelStackView, views: [l1, l2, l3, l4, l5 ,l6])
        
        let b11 = Utility.ourBtnDesign(title: "חום/צהוב/ירוק", radius: 1, tag: 11, image: nil, alignment: .center, type: .system)
        let b12 = Utility.ourBtnDesign(title: "אדום", radius: 1, tag: 12, image: nil, alignment: .center, type: .system)
        let b13 = Utility.ourBtnDesign(title: "לבן/אפור", radius: 1, tag: 13, image: nil, alignment: .center, type: .system)
        let stack1 = Utility.newStack(arrangedSubviews: [b11, b12, b13])
        addTargetToBtn(buttons: stack1.arrangedSubviews as! [UIButton])
        
        let b21 = Utility.ourBtnDesign(title: "משחתי/חלק", radius: 1, tag: 21, image: nil, alignment: .center, type: .system)
        let b22 = Utility.ourBtnDesign(title: "יבש/גללי", radius: 1, tag: 22, image: nil, alignment: .center, type: .system)
        let b23 = Utility.ourBtnDesign(title: "שלשול/מיימי", radius: 1, tag: 23, image: nil, alignment: .center, type: .system)
        let b24 = Utility.ourBtnDesign(title: "ריירי", radius: 1, tag: 24, image: nil, alignment: .center, type: .system)
        let stack2 = Utility.newStack(arrangedSubviews: [b21, b22, b23, b24])
        addTargetToBtn(buttons: stack2.arrangedSubviews as! [UIButton])
        
        let b31 = Utility.ourBtnDesign(title: "קטנה", radius: 1, tag: 31, image: nil, alignment: .center, type: .system)
        let b32 = Utility.ourBtnDesign(title: "רגילה", radius: 1, tag: 32, image: nil, alignment: .center, type: .system)
        let b33 = Utility.ourBtnDesign(title: "חיתול מלא", radius: 1, tag: 33, image: nil, alignment: .center, type: .system)
        let stack3 = Utility.newStack(arrangedSubviews: [b31, b32, b33])
        addTargetToBtn(buttons: stack3.arrangedSubviews as! [UIButton])
        
        let b41 = Utility.ourBtnDesign(title: "צהוב בהיר", radius: 1, tag: 41, image: nil, alignment: .center, type: .system)
        let b42 = Utility.ourBtnDesign(title: "צהוב כהה/חום", radius: 1, tag: 42, image: nil, alignment: .center, type: .system)
        let b43 = Utility.ourBtnDesign(title: "אדום", radius: 1, tag: 43, image: nil, alignment: .center, type: .system)
        let stack4 = Utility.newStack(arrangedSubviews: [b41, b42, b43])
        addTargetToBtn(buttons: stack4.arrangedSubviews as! [UIButton])
        
        let b51 = Utility.ourBtnDesign(title: "רגיל", radius: 1, tag: 51, image: nil, alignment: .center, type: .system)
        let b52 = Utility.ourBtnDesign(title: "חריף", radius: 1, tag: 52, image: nil, alignment: .center, type: .system)
        let stack5 = Utility.newStack(arrangedSubviews: [b51, b52])
        addTargetToBtn(buttons: stack5.arrangedSubviews as! [UIButton])
        
        let b61 = Utility.ourBtnDesign(title: "רגילה", radius: 1, tag: 61, image: nil, alignment: .center, type: .system)
        let b62 = Utility.ourBtnDesign(title: "חיתול מלא", radius: 1, tag: 62, image: nil, alignment: .center, type: .system)
        let stack6 = Utility.newStack(arrangedSubviews: [b61, b62])
        addTargetToBtn(buttons: stack6.arrangedSubviews as! [UIButton])
        
        buttonStackView.addArrangedSubview(stack1)
        buttonStackView.addArrangedSubview(stack2)
        buttonStackView.addArrangedSubview(stack3)
        buttonStackView.addArrangedSubview(stack4)
        buttonStackView.addArrangedSubview(stack5)
        buttonStackView.addArrangedSubview(stack6)
        
        messageLabel.text = "ניתן למלא או צואה או שתן או שניהם*"
    }
}
