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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if !asAttandance{
            addNewStackRow()
            addNewStackRow()
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
        // Do any additional setup after loading the view.
    }
    
    func addNewStackRow(){
        let stack = UIStackView(frame: CGRect(x: mainStackView.layer.frame.minX , y: mainStackView.layer.frame.minY, width: mainStackView.layer.frame.width, height: mainStackView.layer.frame.height))
       
        stack.alignment = .fill
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        mainStackView.addArrangedSubview(stack)
    }
    
    func addAttendanceBtn(){
        let btn = Utility.ourBtnDesign(title: "עדכון נוכחות", radius: 1, tag: 1)
        btn.backgroundColor = UIColor.black
        btn.contentVerticalAlignment = .center
        btn.addTarget(self, action: #selector(attendanceBtnClicked), for: .touchUpInside)
        let firstStack = mainStackView.arrangedSubviews[0] as! UIStackView
        firstStack.addArrangedSubview(btn)
    }
    
    func addKids(){
        let stacks = mainStackView.arrangedSubviews as! [UIStackView]
        for stack in stacks {
            while stack.arrangedSubviews.count < 4{
                let btn = Utility.ourBtnDesign(title: "kid", radius: 80, tag: 1)
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
    
    @IBAction func kidClicked(_ sender: Any) {
        if let btn = sender as? UIButton{
            if asAttandance{
                performSegue(withIdentifier: "updateAttandance", sender: nil)
            }
            else{
                print("\(btn.titleLabel?.text ?? "") pressed with tag \(btn.tag)")
            }
        }
    }
}
