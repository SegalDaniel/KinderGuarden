//
//  GenericDecisionViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GenericDecisionViewController: GenericVC {

    @IBOutlet weak var mainStackView: UIStackView!
    
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
        case .solidFoods:
            solidFoodViews()
            break
        default: break
        }
    }

   
    
    func addToStackAndTarget(_ buttons:[UIButton]){
        buttons.forEach { (btn) in
            btn.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
            mainStackView.addArrangedSubview(btn)
        }
    }
    
    
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
                    presentAgain(kind: .solidFoods)
                }
                else if btn.tag == 2{
                    performSegue(withIdentifier: "GenericLiquid", sender: Enums.BasicEvent.water)
                }
                break
            case .solidFoods:
                if btn.tag == 1{
                    performSegue(withIdentifier: "GenericLiquid", sender: Enums.BasicEvent.milk)
                }
                else if btn.tag == 2{
                    performSegue(withIdentifier: "GenericInfo", sender: Enums.BasicEvent.solidFoods)
                }
                break
            default:
                break
            }
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenericInfo" || segue.identifier == "GenericLiquid" {
            let vc = segue.destination as! GenericVC
            let nextKind = sender as! Enums.BasicEvent
            vc.kind = nextKind
        }
    }
    
    func presentAgain(kind:Enums.BasicEvent){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GenericDecision") as! GenericDecisionViewController
        vc.kind = kind
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    /************************************************** Views Inits *******************************************************/
    
    func fecesViews(){
        let btn1 = Utility.ourBtnDesign(title: "צואה ו/או שתן", radius: 60, tag: 1, image: UIImage(named: "poop"))
        let btn2 = Utility.ourBtnDesign(title: "נקי", radius: 60, tag: 2, image: UIImage(named: "diaper-2"))
        addToStackAndTarget([btn1,btn2])
    }
    
    func foodOrDrinkViews(){
        let btn1 = Utility.ourBtnDesign(title: "אוכל", radius: 60, tag: 1, image: UIImage(named: "cutlery"))
        let btn2 = Utility.ourBtnDesign(title: "שתיה", radius: 60, tag: 2, image: UIImage(named: "water-glass"))
        addToStackAndTarget([btn1,btn2])
    }
    
    func solidFoodViews(){
        let btn1 = Utility.ourBtnDesign(title: "חלב אם/תמ״ל", radius: 60, tag: 1, image: UIImage(named: "023-feeding-bottle-1"))
        let btn2 = Utility.ourBtnDesign(title: "מוצקים", radius: 60, tag: 2, image: UIImage(named: "022-food"))
        addToStackAndTarget([btn1,btn2])
    }

    
    
    
    public enum Kind : Int {
        case Feces = 1
        
    }
}
