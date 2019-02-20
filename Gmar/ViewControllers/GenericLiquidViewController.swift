//
//  GenericLiquidViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GenericLiquidViewController: GenericVC {

    
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var changeTimeBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantitySlider: UISlider!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.text = currentDate()
        initViews()
    }
    
    //https://stackoverflow.com/questions/24070450/how-to-get-the-current-time-as-datetime
    
    func initViews(){
        Utility.addBorder(view: timeLabel, color: UIColor.black, width: 2)
        Utility.addBorder(view: messageLabel, color: UIColor.black, width: 2)
        Utility.addBorder(view: quantityLabel, color: UIColor.black, width: 2)
        switch kind {
        case .water:
            waterSettings()
            break
        case .milk:
            milkSettings()
            break
        default:
            break
        }
    }
    
    func waterSettings(){
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 250
        messageLabel.text = "מים"
    }
    
    func milkSettings(){
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 200
        messageLabel.text = "חלב אם/ תמ״ל"
    }
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
    }
    
    @IBAction func quanSliderChanged(_ sender: Any) {
        quantityLabel.text = "\(Int(quantitySlider.value)) מ״ל"
    }
    
    @IBAction func changeTimeClicked(_ sender: Any) {
        showDatePicker(timeStyle: .short, dateStyle: .medium) { (time) in
            self.timeLabel.text = time
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
