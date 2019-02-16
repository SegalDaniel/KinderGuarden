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
        roundKidsInfoBtn()
        addTeacherToStack(name: "גננת ראשית", tag: 1)
        addTeacherToStack(name: "סייעת א", tag: 2)
        addTeacherToStack(name: "סייעת ב", tag: 3)
        addTeacherToStack(name: "סייעת ג", tag: 4)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func teacherButtonClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            switch btn.tag{
            case 1:
                print("\(btn.titleLabel?.text ?? "") pressed with tag \(btn.tag)")
                break
            case 2:
                print("\(btn.titleLabel?.text ?? "") pressed with tag \(btn.tag)")
                break
            case 3:
                print("\(btn.titleLabel?.text ?? "") pressed with tag \(btn.tag)")
                break
            case 4:
                print("\(btn.titleLabel?.text ?? "") pressed with tag \(btn.tag)")
                break
            default:
                print("not tag")
            }
        }
    }
    
    @IBAction func kidsInfoClicked(_ sender: Any) {
    }
    
    func roundKidsInfoBtn(){
        kidsInfoBtn.layer.cornerRadius = kidsInfoBtn.layer.frame.width / 2
        kidsInfoBtn.clipsToBounds = true
    }
    
    func addTeacherToStack(name:String, tag:Int){
        let btn = UIButton(type: .system)
        btn.setTitle(name, for: .normal)
        btn.setTitleColor(UIColor(red: 235, green: 235, blue: 235, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "SecularOne-Regular", size: 25)
        btn.contentVerticalAlignment = .bottom
        btn.backgroundColor = kgSettingBtn.backgroundColor
        btn.layer.cornerRadius = kidsInfoBtn.layer.cornerRadius
        btn.clipsToBounds = true
        btn.tag = tag
        btn.addTarget(self, action: #selector(teacherButtonClicked), for: .touchUpInside)
        teachersStackView.addArrangedSubview(btn)
    }

}

