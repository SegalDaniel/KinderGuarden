//
//  BasicEventCollectionViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 25/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class BasicEventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    var delegate:BasicEventCollectionViewCellDelegate?
    var event:BasicEvent?
    var eventDescription:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Utility.btnBackColor
        self.layer.cornerRadius = 10
        Utility.addShadow(view: self)
        Utility.viewTapRecognizer(target: self, toBeTapped: mainImageView, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: timeLabel, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: self, action: #selector(tapped))
        if event != nil{
            initEvent()
        }
    }
    
    func initEvent(){
        let type = Enums.BasicEvent.init(rawValue: Int(event!.eventType))!
        let date = event!.eventDate!
        let time = DateAdmin.extractDateAndTime(date: date as Date, dateStyle: .none)
        timeLabel.text = time
        setImageAndDescription(type: type)
    }
    
    func setImageAndDescription(type:Enums.BasicEvent){
        var image:UIImage?
        switch type {
        case .attandance:
            timeLabel.text?.append(" נוכחות")
            image = UIImage(named: "alarm-clock")
            let att = event as! Attendance
            eventDescription = "\(att.type!)\n\(att.authorized?.name ?? "") \(att.authorized?.relation ?? "")\n"
        case .feces:
            timeLabel.text?.append(" צואה")
            image = UIImage(named: "poop")
            let feces = event as! Feces
            eventDescription = "\(feces.amount!)\n\(feces.color!)\n\(feces.texture!)\n"
            break
        case .hafrahsa:
            timeLabel.text?.append(" הפרשה")
            image = UIImage(named: "rainy-nose")
            let haf = event as! Secretion
            eventDescription = "\(haf.type!)\n\(haf.area!)\n"
            break
        case .feever:
            timeLabel.text?.append(" חום")
            image = UIImage(named: "033-thermometer")
            let fev = event as! Fever
            eventDescription = "\(fev.tempreture!)\n"
            break
        case .sleep:
            timeLabel.text?.append(" שינה")
            image = UIImage(named: "048-baby-1")
            let sleep = event as! Sleep
            eventDescription = "\(sleep.type!)\n\(sleep.sleepingScope!)\n\(sleep.allocatedTime!)\n"
            break
        case .solidFoods:
            timeLabel.text?.append(" אוכל מוצק")
            image = UIImage(named: "022-food")
            let sol = event as! SolidFood
            eventDescription = "\(sol.mealType!)\n\(String(sol.amount))\n"
            break
        case .milk:
            timeLabel.text?.append(" חלב")
            image = UIImage(named: "feeder")
            let milk = event as! LiquidFood
            eventDescription = "\(milk.mealType!)\n\(String(milk.amount))\n"
            break
        case .tamal:
            timeLabel.text?.append(" תמ״ל")
            image = UIImage(named: "baby-bottle")
            let tamal = event as! LiquidFood
            eventDescription = "\(tamal.mealType!)\n\(String(tamal.consumedAmount!))\n"
            break
        case .rash:
            timeLabel.text?.append(" פריחה")
            image = UIImage(named: "rash")
            let rash = event as! Rash
            eventDescription = "\(rash.type!)\n\(rash.area!)\n"
            break
        case .urine:
            timeLabel.text?.append(" שתן")
            image = UIImage(named: "010-diaper")
            let pee = event as! Urine
            eventDescription = "\(pee.color!)\n\(pee.amount!)\nריח \(pee.fragrance!)\n"
            break
        case .vomit:
            timeLabel.text?.append(" הקאה")
            image = UIImage(named: "vomit")
            let vom = event as! Vomitus
            eventDescription = "\(vom.type!)\n"
            break
        case .cough:
            timeLabel.text?.append(" שיעול")
            image = UIImage(named: "cough")
            let cough = event as! Cough
            eventDescription = "\(cough.type!)\n"
            break
        case .water:
            timeLabel.text?.append(" מים")
            image = UIImage(named: "water-glass")
            let water = event as! Water
            eventDescription = "\(water.amount) מ״ל"
            break
        default:
            image = UIImage(named: "047-baby-2")
        }
        mainImageView.image = image
        eventDescription.append("דווח על-ידי \(event!.staff!.firstName!) \(event!.staff!.lastName!)")
    }
    
    @IBAction func tapped(_ sender: Any){
        delegate?.cellTapped(event: event!, description: eventDescription)
        self.layer.shadowOpacity = 0.0
        timeLabel.layer.opacity = 0.5
        mainImageView.layer.opacity = 0.5
        UIView.animate(withDuration: 0.2) {
            self.layer.shadowOpacity = 0.5
            self.timeLabel.layer.opacity = 1
            self.mainImageView.layer.opacity = 1
        }
    }
}

protocol BasicEventCollectionViewCellDelegate {
    func cellTapped(event:BasicEvent, description:String)
}
