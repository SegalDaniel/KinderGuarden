//
//  TeacherAddEvent.swift
//  Gmar
//
//  Created by Zach Bachar on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class TeacherAddEventViewController: MyViewController {

    //MARK: - Variables
    @IBOutlet weak var mainStackView: UIStackView!
    var asAttandance:Bool = false
    @IBOutlet weak var attandanceBtn: UIButton!
    @IBOutlet weak var multiChoiseBtn: UIButton!
    var teacherID:String?
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        if !asAttandance{
            Model.instance.getAllAttendedChildsFromCore { (children) in
                let stacksNum:Int = children.count / 4
                for _ in 0...stacksNum{
                    self.addNewStackRow()
                }
                self.addKids(kids: children)
                self.addAttendanceBtn()
            }
            
        }
        else{
            Model.instance.getAllChildsFromCore { (children) in
                let stacksNum:Int = children.count / 4
                for _ in 0...stacksNum{
                    self.addNewStackRow()
                }
                self.addKids(kids: children)
                
            }
        }
    }
    
    //MARK: - Views init
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
    
    
    func addKids(kids:[Child]){
        let stacks = mainStackView.arrangedSubviews as! [UIStackView]
        var children = kids
        for stack in stacks {
            if !asAttandance{
                if stack.tag == -1 { continue }
            }
            while stack.arrangedSubviews.count < 4 && children.count > 0{
                let kid = children.removeLast()
                var btn:UIButton
                let image:UIImage? = Model.instance.loadImageFromDiskWith(fileName: "\(kid.childID!)")
                if let image = image{
                    btn = Utility.ourBtnDesign(title: "\(kid.firstName!) \(kid.lastName!)", radius: 20, tag: Int(kid.childID!)!, image: image)
                }
                else{
                    btn = Utility.ourBtnDesign(title: "\(kid.firstName!) \(kid.lastName!)", radius: 20, tag: Int(kid.childID!)!, image: UIImage(named: "001-baby-6")!)
                }
                if kid.gender == "girl"{
                    btn.backgroundColor = Utility.btnPink
                }
                btn.addTarget(self, action: #selector(kidClicked), for: .touchUpInside)
                btn.addTarget(self, action: #selector(kidDragExit), for: .touchDragExit)
                newButtonShadowAdjust(button: btn)
                stack.addArrangedSubview(btn)
            }
        }
    }

    //MARK: - Buttons actions
    @IBAction func attendanceBtnClicked(_ sender: Any){
        print("Attandance btn clicked")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TeacherAddEvent") as! TeacherAddEventViewController
        vc.asAttandance = true
        vc.teacherID = self.teacherID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func multiChoiseBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "MultiChoose", sender: nil)
    }
    
    
    @IBAction func kidClicked(_ sender: Any) {
        if let btn = sender as? UIButton{
            if asAttandance{
                performSegue(withIdentifier: "GenericInfo", sender: (Enums.BasicEvent.attandance, btn.tag))
            }
            else{
                performSegue(withIdentifier: "EventKind", sender: btn.tag)
            }
        }
    }
    
    @IBAction func kidDragExit(_ sender: Any){
        let btn = sender as! UIButton
        let childID = "\(btn.tag)"
        let alert = UIAlertController(title: "האם ברצונך למחוק משתמש זה?", message: "פעולה זו תהיה בלתי הפיכה", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "אישור", style: .default, handler: { (action) in
            Model.instance.deleteChildFromDB(childID: childID, callback: { (error) in
                if error == nil{
                    alert.dismiss(animated: true, completion: nil)
                    self.present(SimpleAlert(_title: "נמחק בהצלחה", _message: "", dissmissCallback: nil).getAlert(), animated: true, completion: {
                        self.performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
                    })
                }
                else{
                    alert.dismiss(animated: true, completion: nil)
                    self.present(SimpleAlert(_title: "לא נמחק, נסה שנית", _message: "", dissmissCallback: nil).getAlert(), animated: true, completion: nil)
                }
            })
        }))
        alert.addAction(UIAlertAction(title: "ביטול", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenericInfo"{
            let vc = segue.destination as! GenericVC
            let tup = sender as! (Enums.BasicEvent, Int)
            vc.kind = tup.0
            vc.childID = "\(tup.1)"
            vc.teacherID = self.teacherID
        }
        else if segue.identifier == "MultiChoose"{
            
        }
        else if segue.identifier == "EventKind"{
            let vc = segue.destination as! EventKindViewController
            let id = sender as! Int
            Model.instance.eventChildAndStaff(childID: "\(id)", staffID: teacherID!)
            vc.childID = "\(id)"
            vc.teacherID = self.teacherID
        }
    }
    
    //MARK: - Unwind seague
    @IBAction func unwindToSelectKid(segue:UIStoryboardSegue) {
        initViews()
    }
}
