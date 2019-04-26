//
//  MultiChoiseTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class MultiChoiseTableViewCell: UITableViewCell {

    //MARK: - Variables
    @IBOutlet weak var kidNameLabel: UILabel!
    @IBOutlet weak var foodKindBtn: UIButton!
    @IBOutlet weak var quantStackView: UIStackView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var changeTimeBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var foodFinishedBtn: UIButton!
    @IBOutlet weak var foodAboveHalfBtn: UIButton!
    @IBOutlet weak var foodBelowHalfBtn: UIButton!
    @IBOutlet weak var foodDidntBtn: UIButton!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var quantitySlider: UISlider!
    var delegate:MultiChoiseCellDelegate?
    
    var foodBtns:[UIButton] = []
    var data:String?{
        didSet{
            if let label = kidNameLabel{
                label.text = data
            }
        }
    }
    var foodKind:Int = 1
    
    //MARK: - init
    override func awakeFromNib() {
        super.awakeFromNib()
        initChoise()
        initButtons(btns: [foodKindBtn, changeTimeBtn, confirmBtn, foodFinishedBtn, foodAboveHalfBtn, foodBelowHalfBtn, foodDidntBtn])
        confirmBtn.backgroundColor = Utility.backCloverColor
    }
    
    func initButtons(btns:[UIButton]){
        btns.forEach { (btn) in
            Utility.addShadow(view: btn)
            btn.layer.cornerRadius = 10
            btn.addTarget(self, action: #selector(removeShadow), for: .touchDown)
            btn.addTarget(self, action: #selector(reAddShadow), for: .touchDragExit)
            btn.addTarget(self, action: #selector(reAddShadow), for: .touchUpInside)
        }
    }
    
    
    //MARK: - Buttons actions
    @IBAction func removeShadow(_ sender: UIButton) {
        sender.layer.shadowOpacity = 0.0
    }
    
    @IBAction func reAddShadow(_ sender: UIButton) {
        sender.layer.shadowOpacity = 0.5
    }
    
    @IBAction func foodKindBtnClicked(_ sender: Any) {
        toggleFoodKind()
    }
    
    @IBAction func quantSliderChanged(_ sender: Any) {
        sliderLabel.text = "\(Int(quantitySlider.value)*10) מ״ל"
    }
    
    @IBAction func changeTimeBtnClicked(_ sender: Any) {
        DateAdmin.showDatePicker(timeStyle: .short, dateStyle: .none) { (dateString, time, date) in
            self.timeLabel.text = dateString
        }
    }
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        if let btn = sender as? UIButton{
            if btn.tag == 0{
                btn.tag = 1
                btn.setTitle("ביטול", for: .normal)
                btn.backgroundColor = Utility.btnSalmon
            }
            else{
                btn.tag = 0
                btn.setTitle("אישור", for: .normal)
                btn.backgroundColor = Utility.backCloverColor
            }
            delegate?.cellConfirmBtnClicked()
        }
        
    }
    
    //MARK: - Views intis
    func initLabels(labels:[UILabel]){
        labels.forEach { (label) in
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .center
        }
        timeLabel.text = DateAdmin.currentTime(timeStyle: .short)
    }
    
    func toggleFoodKind(){
        switch foodKind {
        case 0:
            hideSlider()
            showSolidBtns()
            foodKind = (foodKind + 1) % 3
            break
        case 1,2:
            hideSolidBtns()
            showSlider()
            foodKind = (foodKind + 1) % 3
            break
        default:
            break
        }
    }
    
    func initChoise(){
        foodKind = 1
        foodBtns = [foodFinishedBtn, foodAboveHalfBtn, foodBelowHalfBtn, foodDidntBtn]
        for btn in foodBtns {
            btn.backgroundColor = Utility.btnGray
            btn.tag = 0
        }
        foodKindBtn.setTitle("מנה מוצקה", for: .normal)
        kidNameLabel.text = data
        initLabels(labels: [kidNameLabel, timeLabel])
        foodKindBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        changeTimeBtn.setTitleColor(Utility.btnTextWhite, for: .normal)
        confirmBtn.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func showSolidBtns(){
        quantStackView.axis = .horizontal
        foodKindBtn.setTitle("מנה מוצקה", for: .normal)
        foodFinishedBtn.isHidden = false
        foodAboveHalfBtn.isHidden = false
        foodBelowHalfBtn.isHidden = false
        foodDidntBtn.isHidden = false
        
    }
    
    func hideSolidBtns(){
        foodFinishedBtn.isHidden = true
        foodAboveHalfBtn.isHidden = true
        foodBelowHalfBtn.isHidden = true
        foodDidntBtn.isHidden = true
    }
    
    func showSlider(){
        quantStackView.axis = .vertical
        if foodKind == 1{
            foodKindBtn.setTitle("חלב אם", for: .normal)
        }
        else if foodKind == 2{
            foodKindBtn.setTitle("תמ״ל", for: .normal)
        }
        sliderLabel.isHidden = false
        quantitySlider.isHidden = false
        quantitySlider.minimumValue = 0
        quantitySlider.maximumValue = 30
    }
    
    func hideSlider(){
        sliderLabel.isHidden = true
        quantitySlider.isHidden = true
    }
    
    @IBAction func quantBtnClicked(_ sender: Any){
        if let btn = sender as? UIButton{
            for fBtn in foodBtns{
                if fBtn == btn{
                    if fBtn.tag == 0{
                        fBtn.backgroundColor = Utility.backCloverColor
                        fBtn.tag = 1
                    }
                    else{
                        fBtn.backgroundColor = Utility.btnGray
                        fBtn.tag = 0
                    }
                }
                else{
                    if fBtn.tag == 1{
                        fBtn.backgroundColor = Utility.btnGray
                        fBtn.tag = 0
                    }
                }
            }
        }
    }
    
}

protocol MultiChoiseCellDelegate {
    func cellConfirmBtnClicked()
}
