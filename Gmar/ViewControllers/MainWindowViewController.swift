//
//  ViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 05/01/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class MainWindowViewController: UIViewController {

    @IBOutlet weak var kgSettingBtn: UIButton!
    @IBOutlet weak var teachersStackView: UIStackView!
    @IBOutlet weak var kidsInfoBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.btnBackColor = kgSettingBtn.backgroundColor
        roundKidsInfoBtn()
        addTeacherToStack(name: "סייעת א", tag: 2)
        addTeacherToStack(name: "סייעת ב", tag: 3)
        addTeacherToStack(name: "סייעת ג", tag: 4)
        addTeacherToStack(name: "גננת ראשית", tag: 1)
    }

    @IBAction func teacherButtonClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            performSegue(withIdentifier: "teacherEvent", sender: btn.tag)
        }
    }
    
    @IBAction func kidsInfoClicked(_ sender: Any) {
    }
    
    func roundKidsInfoBtn(){
        kidsInfoBtn.layer.cornerRadius = kidsInfoBtn.layer.frame.width / 2
        kidsInfoBtn.clipsToBounds = true
    }
    
    func addTeacherToStack(name:String, tag:Int){
        let btn = Utility.ourBtnDesign(title: name, radius: kidsInfoBtn.layer.cornerRadius, tag: tag)
        btn.addTarget(self, action: #selector(teacherButtonClicked), for: .touchUpInside)
        teachersStackView.addArrangedSubview(btn)
    }

}


