//
//  AlertCollectionViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AlertCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var alertTextView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    var alert:Alert?
    var delegate:AlertCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Utility.btnBackColor
        self.layer.cornerRadius = 10
        Utility.addShadow(view: self)
        Utility.viewTapRecognizer(target: self, toBeTapped: alertTextView, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: timeLabel, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: self, action: #selector(tapped))
        
        Utility.viewPanRecognizer(target: self, toBeTapped: alertTextView, action: #selector(dragExit))
        Utility.viewPanRecognizer(target: self, toBeTapped: timeLabel, action: #selector(dragExit))
        Utility.viewPanRecognizer(target: self, toBeTapped: self, action: #selector(dragExit))
        
        if alert != nil{
            initEvent()
        }
        
    }
    
    func initEvent(){
        let date = alert!.alertDate!
        let time = DateAdmin.extractDateAndTime(date: date as Date, dateStyle: .none)
        timeLabel.text = time
        alertTextView.text = "\(alert!.actionNeeded!)"
        switch alert!.level {
        case 1:
            self.backgroundColor = Utility.backCloverColor
            break
        case 2:
            self.backgroundColor = Utility.yellowColor
            break
        case 3:
            self.backgroundColor = Utility.btnSalmon
            break
        default:
            break
        }
    }
    
    @IBAction func tapped(_ sender: Any){
        var text = ""
        if alert?.level == -1 || alert?.level == Int16("-1"){
            text += "טופל!"
        }else{
            text += "לא טופל"
        }
        delegate?.cellTapped(alert: alert!, description: text)
        self.layer.shadowOpacity = 0.0
        timeLabel.layer.opacity = 0.5
        alertTextView.layer.opacity = 0.5
        UIView.animate(withDuration: 0.2) {
            self.layer.shadowOpacity = 0.5
            self.timeLabel.layer.opacity = 1
            self.alertTextView.layer.opacity = 1
        }
    }
    
    @IBAction func dragExit(_ sender: Any){
        delegate?.cellDragExit(alert: alert!)
    }
}

protocol AlertCollectionViewCellDelegate {
    func cellTapped(alert:Alert, description:String)
    func cellDragExit(alert:Alert)
}
