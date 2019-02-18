//
//  BasicEventViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 17/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class BasicEventViewController: UIViewController {

    @IBOutlet weak var rashBtn: UIButton!
    @IBOutlet weak var sleepBtn: UIButton!
    @IBOutlet weak var feedingBtn: UIButton!
    @IBOutlet weak var fecesBtn: UIButton!
    @IBOutlet weak var coughBtn: UIButton!
    @IBOutlet weak var feeverBtn: UIButton!
    @IBOutlet weak var vomitBtn: UIButton!
    @IBOutlet weak var hafrashaBtn: UIButton!
    
    
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
    
    @IBAction func btnClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            performSegue(withIdentifier: "GenericDecision", sender: btn.tag)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "GenericDecision"{
            let vc = segue.destination as! GenericDecisionViewController
            let kind = Enums.BasicEvent(rawValue: (sender as! Int))!
            vc.kind = kind
        }
    }
    

}
