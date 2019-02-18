//
//  EventKindViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 17/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class EventKindViewController: UIViewController {

    @IBOutlet weak var basicEventBtn: UIButton!
    @IBOutlet weak var developEventBtn: UIButton!
    @IBOutlet weak var familiyEventBtn: UIButton!
    @IBOutlet weak var generalEventBtn: UIButton!
    @IBOutlet weak var futureAttEventBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBtns()
    }
    
    func initBtns(){
        basicEventBtn.layer.cornerRadius = basicEventBtn.layer.frame.width / 6
        developEventBtn.layer.cornerRadius = developEventBtn.layer.frame.width / 6
        familiyEventBtn.layer.cornerRadius = familiyEventBtn.layer.frame.width / 6
        generalEventBtn.layer.cornerRadius = generalEventBtn.layer.frame.width / 6
        futureAttEventBtn.layer.cornerRadius = futureAttEventBtn.layer.frame.width / 6
        basicEventBtn.clipsToBounds = true
        developEventBtn.clipsToBounds = true
        familiyEventBtn.clipsToBounds = true
        generalEventBtn.clipsToBounds = true
        futureAttEventBtn.clipsToBounds = true
        Utility.adjustBtnTitle(button: basicEventBtn)
        Utility.adjustBtnTitle(button: developEventBtn)
        Utility.adjustBtnTitle(button: familiyEventBtn)
        Utility.adjustBtnTitle(button: generalEventBtn)
        Utility.adjustBtnTitle(button: futureAttEventBtn)
    }

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
                print("\(btn.titleLabel?.text ?? "") clicked")
                break
            case futureAttEventBtn:
                print("\(btn.titleLabel?.text ?? "") clicked")
                break
            default:
                
                break
            }
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
