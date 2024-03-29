//
//  KidsInfoViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 21/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class KidsInfoViewController: MyViewController {

    //MARK: - Variables
    @IBOutlet weak var childOrCatStackView: UIStackView!
    var startDate:Date!
    var endDate:Date!
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        initTimeBtns()
        initKidsOrCatBtns()
    }
    
    func initTimeBtns(){
        startDate = Date()
        endDate = Date()
    }
    
    func initKidsOrCatBtns(){
        let kidsBtn = MyButtonView(frame: childOrCatStackView.frame, title: "לפי ילד", radius: 20, tag: 1, image: UIImage(named: "001-baby-6")!)
        let heartBtn = MyButtonView(frame: childOrCatStackView.frame, title: "מדידת דופק", radius: 20, tag: 2, image: UIImage(named: "047-baby-2")!)
        kidsBtn.addTarget(self, action: #selector(kidsBtnClicked), for: .touchUpInside)
        heartBtn.addTarget(self, action: #selector(heartBtnClicked), for: .touchUpInside)
        childOrCatStackView.addArrangedSubview(kidsBtn)
        childOrCatStackView.addArrangedSubview(heartBtn)
    }

    @IBAction func kidsBtnClicked(_ sender: Any){
        self.performSegue(withIdentifier: "pickChild", sender: nil)
    }
    
    @IBAction func heartBtnClicked(_ sender: Any){
        self.performSegue(withIdentifier: "heartRateSegue", sender: nil)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickChild"{
            let vc = segue.destination as! TeacherAddEventViewController
            vc.asKidsInfo = true
        }
    }
    

}
