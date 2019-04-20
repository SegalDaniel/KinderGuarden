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
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        roundKidsInfoBtn()
        kgSettingBtn.layer.shadowColor = UIColor.clear.cgColor
        Utility.addShadow(view: kgSettingBtn.imageView!)
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
    
    @IBAction func teacherButtonDragExit(_ sender: Any){
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
        (sender as! UIButton).layer.shadowOpacity = 0.5
        let alert = UIAlertController(title: "Delete Entity", message: "type the name", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Entity name"
        }
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (action) in
            let entity = alert.textFields![0].text!
            Model.instance.deleteAllDataFromCore(entity)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
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
        btn.addTarget(self, action: #selector(teacherButtonDragExit), for: .touchDragExit)
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


