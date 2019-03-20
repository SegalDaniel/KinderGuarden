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
        case .feever:
            feeverSettings()
            break
        default:
            break
        }
    }
   
    @IBAction func confirmBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
    }
    
    @IBAction func quanSliderChanged(_ sender: Any) {
        if kind == .feever{
            let val = Double(quantitySlider.value).rounded(toPlaces: 1)
            quantityLabel.text = "\(val) מעלות"
        }
        else{
            let val = Int(quantitySlider.value) * 10
            quantityLabel.text = "\(val) מ״ל"
        }
    }
    
    @IBAction func changeTimeClicked(_ sender: Any) {
        showDatePicker(timeStyle: .short, dateStyle: .medium) { (time) in
            self.timeLabel.text = time
        }
    }
    
    /***************************  init views  ****************************************/

    func waterSettings(){
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 25
        quantitySlider.setValue(12.5, animated: true)
        messageLabel.text = "מים"
    }
    
    func milkSettings(){
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 20
        quantitySlider.setValue(10, animated: true)
        messageLabel.text = "חלב אם/תמ״ל"
    }
    
    func feeverSettings(){
        quantitySlider.minimumValue = 35
        quantitySlider.maximumValue = 42
        quantitySlider.setValue(36, animated: true)
        quantityLabel.text = "מעלות"
        messageLabel.text = "חום"
    }
}
