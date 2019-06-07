//
//  DevelopEventCollectionViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 19/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class DevelopEventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var eventTextView: UITextView!
    var event:DevelopmentalEvent?
    var delegate:DevelopEventCollectionViewCellDelegate?
    var details:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Utility.btnBackColor
        self.layer.cornerRadius = 10
        Utility.addShadow(view: self)
        Utility.viewTapRecognizer(target: self, toBeTapped: eventTextView, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: timeLabel, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: self, action: #selector(tapped))
        
        Utility.viewPanRecognizer(target: self, toBeTapped: eventTextView, action: #selector(dragExit))
        Utility.viewPanRecognizer(target: self, toBeTapped: timeLabel, action: #selector(dragExit))
        Utility.viewPanRecognizer(target: self, toBeTapped: self, action: #selector(dragExit))
        
        if event != nil{
            initEvent()
        }
        if let details = details{
            eventTextView.text = details
        }
    }
    
    func initEvent(){
        let date = event!.eventDate!
        let time = DateAdmin.extractDateAndTime(date: date as Date, dateStyle: .none)
        timeLabel.text = time
    }
    
    @IBAction func tapped(_ sender: Any){
        delegate?.cellTapped(event: event!, description: "\(details!)\nדווח על-ידי \(event!.staff!.firstName!) \(event!.staff!.lastName!)")
        self.layer.shadowOpacity = 0.0
        timeLabel.layer.opacity = 0.5
        eventTextView.layer.opacity = 0.5
        UIView.animate(withDuration: 0.2) {
            self.layer.shadowOpacity = 0.5
            self.timeLabel.layer.opacity = 1
            self.eventTextView.layer.opacity = 1
        }
    }
    
    @IBAction func dragExit(_ sender: Any){
        delegate?.cellDragExit(event: event!)
    }
}


protocol DevelopEventCollectionViewCellDelegate {
    func cellTapped(event:DevelopmentalEvent, description:String)
    func cellDragExit(event: DevelopmentalEvent)
}
