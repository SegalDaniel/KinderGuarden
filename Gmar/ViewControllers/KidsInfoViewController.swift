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
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var startDateBtn: UIButton!
    @IBOutlet weak var endDateBtn: UIButton!
    @IBOutlet weak var childOrCatStackView: UIStackView!
    var startDate:Date!
    var endDate:Date!
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        initTimeBtns()
        initKidsOrCatBtns()
        addDatesBorder()
    }
    
    func initTimeBtns(){
        startDate = Date()
        endDate = Date()
        startDateBtn.setTitle(DateAdmin.currentDate(timeStyle: .none, dateStyle: .long), for: .normal)
        endDateBtn.setTitle(DateAdmin.currentDate(timeStyle: .none, dateStyle: .long), for: .normal)
    }
    
    func addDatesBorder(){
        let _ = Utility.addBorder(superView: self.view, constraintTop: startLabel, constraintLeading: startLabel, constraintTrailing: startLabel, constraintBottom: startDateBtn, constant: 5)
        let _ = Utility.addBorder(superView: self.view, constraintTop: endLabel, constraintLeading: endLabel, constraintTrailing: endLabel, constraintBottom: endDateBtn, constant: 5)
    }
    
    func initKidsOrCatBtns(){
        let kidsBtn = MyButtonView(frame: childOrCatStackView.frame, title: "לפי ילד", radius: 20, tag: 1, image: UIImage(named: "001-baby-6")!)
        let categoryBtn = MyButtonView(frame: childOrCatStackView.frame, title: "לפי קטגוריה", radius: 20, tag: 2, image: UIImage(named: "check-mark")!)
        childOrCatStackView.addArrangedSubview(kidsBtn)
        childOrCatStackView.addArrangedSubview(categoryBtn)
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
