//
//  UpdateAttandanceViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class UpdateAttandanceViewController: UIViewController {

    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var whenStackView: UIStackView!
    @IBOutlet weak var whoStackView: UIStackView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var whoLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.addBorder(view: whenLabel, color: .black, width: 6)
        Utility.addBorder(view: whoLabel, color: .black, width: 6)
        addWhenBtns()
        addWhoBtns()
        // Do any additional setup after loading the view.
    }
    
    
    
    func addWhenBtns(){
        let btn1 = Utility.ourBtnDesign(title: "הגעה", radius: 1, tag: 1)
        let btn2 = Utility.ourBtnDesign(title: "עזיבה", radius: 1, tag: 2)
        btn1.addTarget(self, action: #selector(whenBtnClicked), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(whenBtnClicked), for: .touchUpInside)
        whenStackView.addArrangedSubview(btn1)
        whenStackView.addArrangedSubview(btn2)
    }
    
    func addWhoBtns(){
        let btn1 = Utility.ourBtnDesign(title: "אמא", radius: 1, tag: 1)
        let btn2 = Utility.ourBtnDesign(title: "אבא", radius: 1, tag: 2)
        let btn3 = Utility.ourBtnDesign(title: "סבא", radius: 1, tag: 3)
        btn1.addTarget(self, action: #selector(whoBtnClicked), for: .touchUpInside)
        btn2.addTarget(self, action: #selector(whoBtnClicked), for: .touchUpInside)
        btn3.addTarget(self, action: #selector(whoBtnClicked), for: .touchUpInside)
        whoStackView.addArrangedSubview(btn1)
        whoStackView.addArrangedSubview(btn2)
        whoStackView.addArrangedSubview(btn3)
    }
    
    @IBAction func whenBtnClicked(_ sender: Any) {
        if let btn = sender as? UIButton{
            switch btn.tag{
                case 1:
                    whenLabel.text = "הגעה"
                    break
                case 2:
                    whenLabel.text = "עזיבה"
                    break
                default:
                    break
            }
        }
    }
    
    @IBAction func whoBtnClicked(_ sender: Any) {
        if let btn = sender as? UIButton{
            switch btn.tag{
            case 1:
                whoLabel.text = "אמא"
                break
            case 2:
                whoLabel.text = "אבא"
                break
            case 3:
                whoLabel.text = "סבא"
                break
            default:
                break
            }
        }
    }
   
    @IBAction func confirmBtnClicked(_ sender: Any) {
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
