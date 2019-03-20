//
//  TeacherAddEvent.swift
//  Gmar
//
//  Created by Zach Bachar on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class TeacherAddEventViewController: UIViewController {

    @IBOutlet weak var mainStackView: UIStackView!
    var asAttandance:Bool = false
    @IBOutlet weak var attandanceBtn: UIButton!
    @IBOutlet weak var multiChoiseBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        if !asAttandance{
            addNewStackRow()
            addNewStackRow()
            addAttendanceBtn()
            addKids()
        }
        else{
            addNewStackRow()
            addNewStackRow()
            addNewStackRow()
            addNewStackRow()
            addKids()
        }
    }
    
    func addNewStackRow(){
        let stack = Utility.newStack(frame: CGRect(x: mainStackView.layer.frame.minX , y: mainStackView.layer.frame.minY, width: mainStackView.layer.frame.width, height: mainStackView.layer.frame.height))
        stack.axis = .horizontal
        mainStackView.addArrangedSubview(stack)
    }
    
    func addAttendanceBtn(){
        let attandance = Utility.ourBtnDesign(title: "עדכון נוכחות", radius: 20, tag: 0, image: UIImage(named: "alarm-clock"))
        let multi = Utility.ourBtnDesign(title: "בחירה מרובה", radius: 20, tag: 1, image: UIImage(named: "checklist"))
        attandance.addTarget(self, action: #selector(attendanceBtnClicked), for: .touchUpInside)
        multi.addTarget(self, action: #selector(multiChoiseBtnClicked), for: .touchUpInside)
        attandance.backgroundColor = Utility.btnSalmon
        multi.backgroundColor = Utility.btnSalmon
        (mainStackView.arrangedSubviews[0] as! UIStackView).addArrangedSubview(attandance)
        (mainStackView.arrangedSubviews[0] as! UIStackView).addArrangedSubview(multi)
    }
    
    func addKids(){
        let stacks = mainStackView.arrangedSubviews as! [UIStackView]
        for stack in stacks {
            if !asAttandance{
                if stack.tag == -1 { continue }
            }
            while stack.arrangedSubviews.count < 4{
                let btn = Utility.ourBtnDesign(title: "ילד", radius: 20, tag: 1, image: UIImage(named: "001-baby-6"))
                if stack.arrangedSubviews.count % 2 == 0{
                    btn.setTitle("ילדה", for: .normal)
                    btn.backgroundColor = UIColor.purple
                }
                btn.addTarget(self, action: #selector(kidClicked), for: .touchUpInside)
                stack.addArrangedSubview(btn)
            }
        }
    }

    @IBAction func attendanceBtnClicked(_ sender: Any){
        print("Attandance btn clicked")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TeacherAddEvent") as! TeacherAddEventViewController
        vc.asAttandance = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func multiChoiseBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "MultiChoose", sender: nil)
    }
    
    
    @IBAction func kidClicked(_ sender: Any) {
        if let btn = sender as? UIButton{
            if asAttandance{
                performSegue(withIdentifier: "GenericInfo", sender: Enums.BasicEvent.attandance)
            }
            else{
                performSegue(withIdentifier: "EventKind", sender: btn.tag)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenericInfo"{
            let vc = segue.destination as! GenericVC
            vc.kind = sender as! Enums.BasicEvent
        }
        else if segue.identifier == "MultiChoose"{
            
        }
    }
    
    @IBAction func unwindToSelectKid(segue:UIStoryboardSegue) { }
}
