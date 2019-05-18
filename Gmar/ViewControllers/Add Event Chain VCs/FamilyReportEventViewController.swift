//
//  FamilyReportEventViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class FamilyReportEventViewController: GenericVC {

    //MARK: = Variables
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var topicBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var timeBtn: UIButton!
    let dataSource:[String] = ["בחר נושא","חום קל","מחלה או שרידי מחלה","פריחה","דלקת","שיעול טורדני","צינון ו/או נזלת","חוסר תיאבון מתמשך","חוסר שקט / בכי מתמשך","חיסון","שינה לא רציפה","יציאת שן","מעבר למוצקים","עצירות","מעבר לתמ״ל","החלפת סוג תמ״ל","מתן תרופה","אחר"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeBtn.setTitle(currentDate(), for: .normal)
        Utility.addBorder(view: descTextField)
    }
    
    //MARK: - buttons actions
    @IBAction func topicBtnClicked(_ sender: Any) {
        self.view.endEditing(true)
        RPicker.selectOption(dataArray: dataSource) { (topic, row) in
            self.topicBtn.setTitle(topic, for: .normal)
        }
    }
    
    @IBAction func timeBtnClicked(_ sender: Any) {
        showDatePicker(timeStyle: .short, dateStyle: .medium) { (dateString, time, date) in
            self.timeBtn.setTitle(dateString, for: .normal)
        }
    }
    @IBAction func confirmBtnClicked(_ sender: Any) {
    }

}
