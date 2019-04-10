//
//  BasicEventViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 17/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class BasicEventViewController: UIViewController {

    //MARK: - Variables
    @IBOutlet weak var rashBtn: UIButton!
    @IBOutlet weak var sleepBtn: UIButton!
    @IBOutlet weak var feedingBtn: UIButton!
    @IBOutlet weak var fecesBtn: UIButton!
    @IBOutlet weak var coughBtn: UIButton!
    @IBOutlet weak var feeverBtn: UIButton!
    @IBOutlet weak var vomitBtn: UIButton!
    @IBOutlet weak var hafrashaBtn: UIButton!
    var childID:String?
    var teacherID:String?
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        initBtns([rashBtn, sleepBtn, feedingBtn, fecesBtn, coughBtn, feeverBtn, vomitBtn, hafrashaBtn])
        
        // Do any additional setup after loading the view.
    }
    
    func initBtns(_ buttons:[UIButton]){
        buttons.forEach { (btn) in
            btn.layer.cornerRadius = btn.layer.frame.width / 6
            btn.clipsToBounds = true
            Utility.adjustBtnTitle(button: btn)
        }
    }
    
    //MARK: - buttons actions
    @IBAction func btnClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            let kind = Enums.BasicEvent(rawValue: btn.tag)!
            switch kind{
            case .feces, .feed:
                performSegue(withIdentifier: "GenericDecision", sender: kind)
                break
            case .vomit, .sleep, .rash, .cough, .hafrahsa:
                performSegue(withIdentifier: "GenericEventInfo", sender: kind)
                break
            case .feever:
                performSegue(withIdentifier: "GenericLiquid", sender: kind)
            default: break
            }
            
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "GenericDecision" || segue.identifier == "GenericEventInfo" || segue.identifier == "GenericLiquid"{
            let vc = segue.destination as! GenericVC
            vc.kind = sender as! Enums.BasicEvent
            vc.childID = self.childID
            vc.teacherID = self.teacherID
        }
    }
    

}
