//
//  ViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 05/01/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class MainWindowViewController: UIViewController {

    //MARK: - Varaiables
    @IBOutlet weak var kgSettingBtn: UIButton!
    @IBOutlet weak var teachersStackView: UIStackView!
    @IBOutlet weak var kidsInfoBtn: UIButton!
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        roundKidsInfoBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    @IBAction func teacherButtonLongPressed(_ sender: Any){
        if let btn = sender as? UIButton{
            let staffID = "\(btn.tag)"
            let alert = UIAlertController(title: "האם ברצונך למחוק משתמש זה?", message: "פעולה זו תהיה בלתי הפיכה", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "אישור", style: .default, handler: { (action) in
                Model.instance.deleteStaffFromDB(staffID: staffID, callback: { (error) in
                    if error == nil{
                        alert.dismiss(animated: true, completion: nil)
                        self.present(SimpleAlert(_title: "נמחק בהצלחה", _message: "", dissmissCallback: nil).getAlert(), animated: true, completion: {
                            Model.instance.getStaffFromDB { (staff) in
                                self.initStaffViews(staff: staff)
                            }
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
    }
    
    func addTeacherToStack(name:String, tag:Int, imageName:String?){
        var image:UIImage
        if imageName != nil{
            image = Model.instance.loadImageFromDiskWith(fileName: imageName!)!
        }
        else{
            image = UIImage(named: "teacher")!
        }
        let btn = Utility.ourBtnDesign(title: name, radius: kidsInfoBtn.layer.cornerRadius, tag: tag, image: image)
        btn.addTarget(self, action: #selector(teacherButtonClicked), for: .touchUpInside)
        btn.addTarget(self, action: #selector(teacherButtonLongPressed), for: .touchDragExit)
        teachersStackView.addArrangedSubview(btn)
    }

    //MARK: - unwind segue
    @IBAction func unwindToMainWindow(segue:UIStoryboardSegue) { }
    
    
    //********************Testing Method********************//
//    func testDBs(){
//        let child = Child(childID: "203037346", name: "zach", gender: "male", lastName: "bachar", age: "27", birthDate: "9.3.92", image: nil)
//        Model.instance.addChild(child: child) { (err) in
//            if err == nil{
//                Model.instance.getAllChildsFromCore { (childs) in
//                    Model.instance.getChild(childID: childs.first!.childID!, callback: { (err, childFB) in
//                        print(childFB!.name!)
//                    })
//                }
//            }
//        }
//    }
}


