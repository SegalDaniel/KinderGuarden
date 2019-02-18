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
            removeAttandance()
            addNewStackRow()
            
            addNewStackRow()
            addKids()
        }
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
        attandanceBtn.backgroundColor = UIColor.lightGray
        attandanceBtn.layer.cornerRadius = 20
        Utility.adjustBtnTitle(button: attandanceBtn)
    }
    
    func removeAttandance(){
        attandanceBtn.removeFromSuperview()
    }
    
    func addKids(){
        let stacks = mainStackView.arrangedSubviews as! [UIStackView]
        for stack in stacks {
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
    
    @IBAction func kidClicked(_ sender: Any) {
        if let btn = sender as? UIButton{
            if asAttandance{
                performSegue(withIdentifier: "updateAttandance", sender: nil)
            }
            else{
                performSegue(withIdentifier: "EventKind", sender: btn.tag)
            }
        }
    }
}
