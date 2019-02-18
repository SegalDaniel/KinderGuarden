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
        initBtns()
        // Do any additional setup after loading the view.
    }
    
    func initBtns(){
        rashBtn.layer.cornerRadius = rashBtn.layer.frame.width / 6
        sleepBtn.layer.cornerRadius = sleepBtn.layer.frame.width / 6
        feedingBtn.layer.cornerRadius = feedingBtn.layer.frame.width / 6
        fecesBtn.layer.cornerRadius = fecesBtn.layer.frame.width / 6
        coughBtn.layer.cornerRadius = coughBtn.layer.frame.width / 6
        feeverBtn.layer.cornerRadius = feeverBtn.layer.frame.width / 6
        vomitBtn.layer.cornerRadius = vomitBtn.layer.frame.width / 6
        hafrashaBtn.layer.cornerRadius = hafrashaBtn.layer.frame.width / 6
        rashBtn.clipsToBounds = true
        sleepBtn.clipsToBounds = true
        feedingBtn.clipsToBounds = true
        fecesBtn.clipsToBounds = true
        coughBtn.clipsToBounds = true
        feeverBtn.clipsToBounds = true
        vomitBtn.clipsToBounds = true
        hafrashaBtn.clipsToBounds = true
        Utility.adjustBtnTitle(button: rashBtn)
        Utility.adjustBtnTitle(button: sleepBtn)
        Utility.adjustBtnTitle(button: feedingBtn)
        Utility.adjustBtnTitle(button: fecesBtn)
        Utility.adjustBtnTitle(button: coughBtn)
        Utility.adjustBtnTitle(button: feeverBtn)
        Utility.adjustBtnTitle(button: vomitBtn)
        Utility.adjustBtnTitle(button: hafrashaBtn)
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
