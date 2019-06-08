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
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var quantitySlider: UISlider!
    @IBOutlet weak var titleItem: UINavigationItem!
    
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTimeBtn.setTitle(currentDate(), for: .normal)
        initViews()
    }
    
    func initViews(){
        //addConfirmButton(selector: #selector(confirmBtnClicked))
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
            self.changeTimeBtn.setTitle(dateString, for: .normal)
        }
    }
    
    //MARK: - Views Init
    //MARK: - water
    func waterSettings(){
        titleItem.title = "דיווח שתיית מים"
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 10
        quantitySlider.setValue(12.5, animated: true)
    }
    
    //MARK: - milk
    func milkSettings(){
        titleItem.title = "דיווח מאכל חלב אם"
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 30
        quantitySlider.setValue(15, animated: true)
    }
    
    func tamalSettings(){
        titleItem.title = "דיווח מאכל תמ״ל"
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 30
        quantitySlider.setValue(15, animated: true)
    }
    
    //MARK: - feever
    func feeverSettings(){
        titleItem.title = "דיווח מדידת חום"
        quantitySlider.minimumValue = 35
        quantitySlider.maximumValue = 42
        quantitySlider.setValue(36, animated: true)
        quantityLabel.text = "מעלות"
    }
}
