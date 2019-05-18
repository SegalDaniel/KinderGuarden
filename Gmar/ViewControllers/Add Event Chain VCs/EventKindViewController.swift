//
//  EventKindViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 17/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class EventKindViewController: MyViewController {

    //MARK: - Variables
    @IBOutlet weak var basicEventBtn: UIButton!
    @IBOutlet weak var developEventBtn: UIButton!
    @IBOutlet weak var familiyEventBtn: UIButton!
    @IBOutlet weak var generalEventBtn: UIButton!
    @IBOutlet weak var futureAttEventBtn: UIButton!
    var childID:String?
    var teacherID:String?
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        initBtns([basicEventBtn, developEventBtn, familiyEventBtn, generalEventBtn, futureAttEventBtn])
    }
    
    func initBtns(_ buttons: [UIButton]){
        buttons.forEach { (btn) in
            btn.layer.cornerRadius = btn.layer.frame.width / 6
            btn.clipsToBounds = true
            Utility.adjustBtnTitle(button: btn)
        }
    }

    //MARK: - buttons actions
    @IBAction func someEventClicked(_ sender: Any) {
        if let btn = sender as? UIButton{
            switch btn{
            case basicEventBtn:
                print("\(btn.titleLabel?.text ?? "") clicked")
                break
            case developEventBtn:
                print("\(btn.titleLabel?.text ?? "") clicked")
                break
            case familiyEventBtn:
                print("\(btn.titleLabel?.text ?? "") clicked")
                break
            case generalEventBtn:
                generalEventAlert()
                break
            case futureAttEventBtn:
                print("\(btn.titleLabel?.text ?? "") clicked")
                break
            default:
                
                break
            }
        }
    }
    
    func generalEventAlert(){
        let alert = UIAlertController(title: "דיווח כללי", message: "נא להוסיף דיווח כללי לבני המשפחה", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "שמירה", style: .default, handler: { (action) in
            //save the content of the alert
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "ביטול", style: .destructive, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addTextField(configurationHandler: nil)
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BasicEventSegue"{
            let vc = segue.destination as! BasicEventViewController
            vc.childID = self.childID
            vc.teacherID = self.teacherID
        }
        else if segue.identifier == "developmentSegue"{
            let vc = segue.destination as! DevelopmentalEventViewController
            vc.childID = self.childID
            vc.teacherID = self.teacherID
        }
        else if segue.identifier == "familyReportSegue"{
            let vc = segue.destination as! FamilyReportEventViewController
            vc.childID = self.childID
            vc.teacherID = self.teacherID
        }
    }
}
