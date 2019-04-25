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
    var event:BasicEvent?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Utility.btnBackColor
        self.layer.cornerRadius = 10
        if event != nil{
            initEvent()
        }
    }
    
    func initEvent(){
        let type = Enums.BasicEvent.init(rawValue: Int(event!.eventType))!
        let date = event!.eventDate!
        let time = DateAdmin.extractDateAndTime(date: date as Date, dateStyle: .short)
        timeLabel.text = time
        setImage(type: type)
    }
    
    func setImage(type:Enums.BasicEvent){
        var image:UIImage?
        switch type {
        case .feces:
            image = UIImage(named: "poop")
            break
        case .hafrahsa:
            image = UIImage(named: "049-baby")
            break
        case .feever:
            image = UIImage(named: "033-thermometer")
            break
        case .sleep:
            image = UIImage(named: "048-baby-1")
            break
        case .solidFoods:
            image = UIImage(named: "022-food")
            break
        case .milk:
            image = UIImage(named: "024-feeding-bottle")
            break
        case .tamal:
            image = UIImage(named: "024-feeding-bottle-1")
            break
        case .rash:
            image = UIImage(named: "illness")
            break
        case .urine:
            image = UIImage(named: "010-diaper")
            break
        case .vomit:
            image = UIImage(named: "vomit")
            break
        case .cough:
            image = UIImage(named: "cough")
            break
        case .water:
            image = UIImage(named: "water-glass")
            break
        default:
            image = UIImage(named: "047-baby-2")
        }
        mainImageView.image = image
    }
}
