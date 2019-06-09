//
//  ViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 05/01/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class MainWindowViewController: MyViewController {

    //MARK: - Varaiables
    @IBOutlet weak var kgSettingBtn: UIButton!
    @IBOutlet weak var teachersStackView: UIStackView!
    @IBOutlet weak var kidsInfoBtn: UIButton!
    @IBOutlet weak var alertsLabel: UILabel!
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        roundKidsInfoBtn()
        kgSettingBtn.layer.shadowColor = UIColor.clear.cgColor
        Utility.addShadow(view: kgSettingBtn.imageView!)
        Utility.addBorder(view: alertsLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        Model.instance.getStaffFromDB { (staff) in
            self.initStaffViews(staff: staff)
        }
    }

    //MARK: - buttons actions
    @IBAction func teacherButtonClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            self.performSegue(withIdentifier: "teacherEvent", sender: btn.tag)
        }
    }
    
    @IBAction func kidsInfoClicked(_ sender: Any) {
        
    }
    
    //MARK: - Views Inits
    func initStaffViews(staff:[Staff]){
        teachersStackView.arrangedSubviews.forEach { (view) in
            view.removeFromSuperview()
        }
        staff.forEach { (s) in
            addTeacherToStack(name: "\(s.firstName!) \(s.lastName!)", tag: Int(s.staffID!)!, imageName: s.image)
        }
    }
    
    func roundKidsInfoBtn(){
        kidsInfoBtn.layer.cornerRadius = kidsInfoBtn.layer.frame.width / 2
        kidsInfoBtn.clipsToBounds = true
        Utility.addShadow(view: kidsInfoBtn)
    }
    
    func addTeacherToStack(name:String, tag:Int, imageName:String?){
        var image:UIImage
        if imageName != nil{
            image = Model.instance.loadImageFromDiskWith(fileName: imageName!)!
        }
        else{
            image = UIImage(named: "teacher")!
        }
        let btn = MyButtonView(frame: teachersStackView.frame)
        btn.addRadius(radius: kidsInfoBtn.layer.cornerRadius)
        btn.addTag(tag: tag)
        btn.setImage(image: image)
        btn.setTitle(title: name)
        btn.addTarget(self, action: #selector(teacherButtonClicked), for: .touchUpInside)
        teachersStackView.addArrangedSubview(btn)
    }

    //MARK: - unwind segue
    @IBAction func unwindToMainWindow(segue:UIStoryboardSegue) { }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.navigationController?.navigationBar.isHidden = false
        if segue.identifier == "teacherEvent"{
            let vc = segue.destination as! TeacherAddEventViewController
            let tID = sender as! Int
            vc.teacherID = "\(tID)"
        }
    }
}
