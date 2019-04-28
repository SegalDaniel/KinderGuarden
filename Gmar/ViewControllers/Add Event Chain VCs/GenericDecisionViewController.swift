//
//  GenericDecisionViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GenericDecisionViewController: GenericVC {

    //MARK: - Variables
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var titleItem: UINavigationItem!
    
    //MARL: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        switch kind {
        case .feces:
            fecesViews()
            break
        case .feed:
            foodOrDrinkViews()
            break
        case .solidorMilk:
            solidorMilkViews()
            break
        default: break
        }
    }
    
    //MARL: - buttons actions
    @IBAction func btnClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            print("clicked \(String(describing: btn.titleLabel!.text)) tag: \(btn.tag)")
            switch kind{
            case .feces:
                if btn.tag == 1{
                    performSegue(withIdentifier: "GenericInfo", sender: Enums.BasicEvent.feces)
                }
                else if btn.tag == 2{
                    performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
                }
                break
            case .feed:
                if btn.tag == 1{
                    presentAgain(kind: .solidorMilk)
                }
                else if btn.tag == 2{
                    performSegue(withIdentifier: "GenericLiquid", sender: Enums.BasicEvent.water)
                }
                break
            case .solidorMilk:
                if btn.tag == 1{
                    performSegue(withIdentifier: "GenericLiquid", sender: Enums.BasicEvent.milk)
                }
                else if btn.tag == 2{
                    performSegue(withIdentifier: "GenericLiquid", sender: Enums.BasicEvent.tamal)
                }
                else if btn.tag == 3{
                    performSegue(withIdentifier: "GenericInfo", sender: Enums.BasicEvent.solidFoods)
                }
                break
            default:
                break
            }
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenericInfo" || segue.identifier == "GenericLiquid" {
            let vc = segue.destination as! GenericVC
            let nextKind = sender as! Enums.BasicEvent
            vc.kind = nextKind
            vc.childID = self.childID
            vc.teacherID = self.teacherID
        }
    }
    
    func presentAgain(kind:Enums.BasicEvent){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GenericDecision") as! GenericDecisionViewController
        vc.kind = kind
        vc.childID = self.childID
        vc.teacherID = self.teacherID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /************************************************** Views Inits *******************************************************/
    //MARK: - Views Inits
    func addToStackAndTarget(_ buttons:[MyButtonView]){
        buttons.forEach { (btn) in
            btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
            mainStackView.addArrangedSubview(btn)
        }
    }
    
    func fecesViews(){
        titleItem.title = "דיווח צרכים"
        let btn1 = MyButtonView(frame: mainStackView.frame, title: "צואה ו/או שתן", radius: 60, tag: 1, image: UIImage(named: "poop")!)
        let btn2 = MyButtonView(frame: mainStackView.frame, title: "נקי", radius: 60, tag: 2, image: UIImage(named: "diaper-2")!)
        addToStackAndTarget([btn1,btn2])
    }
    
    func foodOrDrinkViews(){
        titleItem.title = "דיווח האכלה"
        let btn1 = MyButtonView(frame: mainStackView.frame, title: "אוכל", radius: 60, tag: 1, image: UIImage(named: "cutlery")!)
        let btn2 = MyButtonView(frame: mainStackView.frame, title: "שתיה", radius: 60, tag: 2, image:  UIImage(named: "water-glass")!)
        addToStackAndTarget([btn1,btn2])
    }
    
    func solidorMilkViews(){
        titleItem.title = "דיווח האכלה"
        var milk = false
        var tamal = false
        var solid = false
        child?.foodList?.forEach({ (obj) in
            let food = obj as! Food
            if food.type == "milk"{
                milk = true
            }
            else if food.type == "solid"{
                solid = true
            }
            else if food.type == "tamal"{
                tamal = true
            }
        })
        let btn1 = MyButtonView(frame: mainStackView.frame, title: "חלב אם", radius: 60, tag: 1, image: UIImage(named: "feeder")!)
        let btn2 = MyButtonView(frame: mainStackView.frame, title: "תמ״ל", radius: 60, tag: 2, image: UIImage(named: "baby-bottle")!)
        let btn3 = MyButtonView(frame: mainStackView.frame, title: "מוצקים", radius: 60, tag: 3, image: UIImage(named: "022-food")!)
        btn1.isEnabled = milk
        btn2.isEnabled = tamal
        btn3.isEnabled = solid
        addToStackAndTarget([btn1,btn2,btn3])
    }
    
}
