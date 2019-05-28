//
//  SettingsViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class SettingsViewController: MyViewController {
    
    //MARK: - Variables
    @IBOutlet weak var addChildBtn: UIButton!
    @IBOutlet weak var addStaffBtn: UIButton!
    @IBOutlet weak var KindergardenSettingBtn: UIButton!
    @IBOutlet weak var deleteStaffKidBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews(buttons:[addChildBtn, addStaffBtn, KindergardenSettingBtn, deleteStaffKidBtn])
    }
    
    //MARK: - Init Views
    func initViews(buttons:[UIButton]){
        buttons.forEach { (btn) in
            Utility.adjustBtnTitle(button: btn)
            btn.layer.cornerRadius = btn.layer.frame.width / 6
            btn.clipsToBounds = true
            Utility.addShadow(view: btn)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
