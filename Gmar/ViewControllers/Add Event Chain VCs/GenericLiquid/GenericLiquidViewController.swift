//
//  GenericLiquidViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GenericLiquidViewController: GenericVC {

    //MARK: - Variables
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var changeTimeBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantitySlider: UISlider!
    @IBOutlet weak var messageLabel: UILabel!
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.adjustLabelDesign(label: messageLabel)
        Utility.adjustLabelDesign(label: timeLabel)
        timeLabel.text = currentDate()
        initViews()
    }
    
    func initViews(){
        addConfirmButton(selector: #selector(confirmBtnClicked))
        switch kind {
        case .water:
            waterSettings()
            break
        case .milk:
            milkSettings()
            break
        case .tamal:
            tamalSettings()
            break
        case .feever:
            feeverSettings()
            break
        default:
            break
        }
    }
   
    //MARK: - buttons actions
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
        showDatePicker(timeStyle: .short, dateStyle: .medium) { (dateString, time, date) in
            self.timeLabel.text = dateString
        }
    }
    
    //MARK: - Views Init
    //MARK: - water
    func waterSettings(){
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 25
        quantitySlider.setValue(12.5, animated: true)
        messageLabel.text = "מים"
    }
    
    //MARK: - milk
    func milkSettings(){
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 20
        quantitySlider.setValue(10, animated: true)
        messageLabel.text = "חלב אם"
    }
    
    func tamalSettings(){
        var tamals = ""
        child?.foodList?.forEach({ (obj) in
            let food = obj as! Food
            if food.type == "tamal"{
                tamals.append("\(food.details!) ")
            }
        })
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 20
        quantitySlider.setValue(10, animated: true)
        messageLabel.text = tamals
    }
    
    //MARK: - feever
    func feeverSettings(){
        quantitySlider.minimumValue = 35
        quantitySlider.maximumValue = 42
        quantitySlider.setValue(36, animated: true)
        quantityLabel.text = "מעלות"
        messageLabel.text = "חום"
    }
}
