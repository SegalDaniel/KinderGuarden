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
    var selectedDate:Date?
    var selectedTime:String?
    var delegate:MultiChoiseCellDelegate?
    var indexPath:IndexPath?
    var foodBtns:[UIButton] = []
    var child:Child?{
        didSet{
            child?.foodList?.forEach({ (obj) in
                let food = obj as! Food
                if !availableFoods.contains(food.type!){
                    availableFoods.append(food.type!)
                }
            })
            toggleFoodKind()
        }
    }
    var availableFoods:[String] = []
    var data:String?{
        didSet{
            if let label = kidNameLabel{
                label.text = data
            }
        }
    }
    var foodKind:Int = 1
    var pressed:Bool = false
    
    //MARK: - init
    override func awakeFromNib() {
        super.awakeFromNib()
        initChoise()
        initButtons(btns: [foodKindBtn, changeTimeBtn, confirmBtn, foodFinishedBtn, foodAboveHalfBtn, foodBelowHalfBtn, foodDidntBtn])
        confirmBtn.backgroundColor = Utility.backCloverColor
        confirmBtn.addTarget(self, action: #selector(confirmPressed), for: .touchUpInside)
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
            self.selectedDate = date
            self.selectedTime = time
        }
    }
    
    //need more debugging
    @IBAction func confirmPressed(_ sender: Any){
        let kind = foodKindBtn.title(for: .normal)
        let eventDate = getEventDate()
        switch kind {
        case "מנה מוצקה":
            if let foodBtn = foodBtns.first(where: { (btn) -> Bool in
                if btn.tag == 1 { return true }
                else { return false}
            }){
                if let consumed = foodBtn.attributedTitle(for: .normal) {
                    let eventType:Int16 = Int16(Enums.BasicEvent.solidFoods.rawValue)
                    var mealType:String
                    var eventHour:Int
                    if let time = selectedTime{
                        eventHour = Int(time.split(separator: ":")[0])!
                    }
                    else{
                        let formatter1 = DateFormatter()
                        formatter1.dateStyle = .none
                        formatter1.timeStyle = .short
                        let time = formatter1.string(from: Date())
                        eventHour = Int(time.split(separator: ":")[0])!
                    }
                    if eventHour > 12{
                        mealType = "ארוחת צהריים"
                    }
                    else{
                        mealType = "ארוחת בוקר"
                    }
                    delegate?.cellConfirmBtnClicked(indexPath: indexPath!, child: child!, mealType: mealType, consumed: consumed.string, eventDate: eventDate, eventType: eventType, cell: self)
                }
            }
            else{
                delegate?.showUnselectedAlert(message: "נא לבחור את כמות המזון שנאכלה")
            }
            break
        case "חלב אם":
            let eventType:Int16 = Int16(Enums.BasicEvent.tamal.rawValue)
            let consumedTxt = sliderLabel.text!
            var consumed:String
            if consumedTxt == "כמות"{
                delegate?.showUnselectedAlert(message: "נא לבחור את כמות המזון שנאכלה")
            }
            else{
                consumed = "\(consumedTxt.split(separator: " ")[0])"
                delegate?.cellConfirmBtnClicked(indexPath: indexPath!, child: child!, mealType: "tamal", consumed: consumed, eventDate: eventDate, eventType: eventType, cell: self)
            }
            break
        case "תמ״ל":
            let eventType:Int16 = Int16(Enums.BasicEvent.milk.rawValue)
            let consumedTxt = sliderLabel.text!
            var consumed:String
            if consumedTxt == "כמות"{
                delegate?.showUnselectedAlert(message: "נא לבחור את כמות המזון שנאכלה")
            }
            else{
                consumed = "\(consumedTxt.split(separator: " ")[0])"
                delegate?.cellConfirmBtnClicked(indexPath: indexPath!, child: child!, mealType: "millk", consumed: consumed, eventDate: eventDate, eventType: eventType, cell: self)
            }
            break
        default:
            break
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
        switch availableFoods[foodKind] {
        case "solid":
            hideSlider()
            showSolidBtns()
            foodKindBtn.setTitle("מנה מוצקה", for: .normal)
            foodKind = (foodKind + 1) % availableFoods.count
            break
        case "milk":
            hideSolidBtns()
            showSlider()
            foodKindBtn.setTitle("חלב אם", for: .normal)
            foodKind = (foodKind + 1) % availableFoods.count
            break
        case "tamal":
            hideSolidBtns()
            showSlider()
            foodKindBtn.setTitle("תמ״ל", for: .normal)
            foodKind = (foodKind + 1) % availableFoods.count
            break
        default:
            break
        }
    }
    
    func initChoise(){
        foodKind = 0
        foodBtns = [foodFinishedBtn, foodAboveHalfBtn, foodBelowHalfBtn, foodDidntBtn]
        for btn in foodBtns {
            btn.backgroundColor = Utility.btnGray
            btn.tag = 0
        }
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
    
    func getEventDate() -> Date{
        var eventDate:Date
        if selectedDate == nil{
            eventDate = Date()
        }
        else{
            eventDate = selectedDate!
        }
        return eventDate
    }
    
}

protocol MultiChoiseCellDelegate {
    func cellConfirmBtnClicked(indexPath:IndexPath, child:Child, mealType:String, consumed:String, eventDate:Date, eventType:Int16, cell:MultiChoiseTableViewCell)
    func showUnselectedAlert(message:String)
}
