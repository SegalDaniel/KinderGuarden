//
//  GenericDecisionViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GenericDecisionViewController: UIViewController {

    @IBOutlet weak var mainStackView: UIStackView!
    var kind:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
    }
    
    func initViews(){
        switch kind {
        case 1:
            fecesViews()
            break
        default: break
        }
    }

    func fecesViews(){
        let btn1 = Utility.ourBtnDesign(title: "צואה ו/או שתן", radius: 60, tag: 1, image: UIImage(named: "poop"))
        let btn2 = Utility.ourBtnDesign(title: "נקי", radius: 60, tag: 2, image: UIImage(named: "diaper-2"))
        addToStackAndTarget([btn1,btn2])
    }
    
    func addToStackAndTarget(_ buttons:[UIButton]){
        buttons.forEach { (btn) in
            btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
            mainStackView.addArrangedSubview(btn)
        }
    }
    
    
    @IBAction func btnClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            performSegue(withIdentifier: "GenericInfo", sender: btn.tag)
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenericInfo"{
            let vc = segue.destination as! GenericEventInfoViewController
            vc.kind = sender as? Int ?? 0
        }
    }
    

}
