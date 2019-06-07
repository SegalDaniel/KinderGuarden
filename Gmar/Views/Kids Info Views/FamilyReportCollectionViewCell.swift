//
//  FamilyReportCollectionViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class FamilyReportCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var reportTextView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    var report:FamilyReport?
    var delegate:FamilyReportCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Utility.btnBackColor
        self.layer.cornerRadius = 10
        Utility.addShadow(view: self)
        Utility.viewTapRecognizer(target: self, toBeTapped: reportTextView, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: timeLabel, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: self, action: #selector(tapped))
        
        Utility.viewPanRecognizer(target: self, toBeTapped: reportTextView, action: #selector(dragExit))
        Utility.viewPanRecognizer(target: self, toBeTapped: timeLabel, action: #selector(dragExit))
        Utility.viewPanRecognizer(target: self, toBeTapped: self, action: #selector(dragExit))
        
        if report != nil{
            initEvent()
        }
        
    }
    
    func initEvent(){
        let date = report!.eventDate!
        let time = DateAdmin.extractDateAndTime(date: date as Date, dateStyle: .none)
        timeLabel.text = time
        reportTextView.text = "\(report!.topic!)\n\(report!.details ?? "")"
    }
    
    @IBAction func tapped(_ sender: Any){
        delegate?.cellTapped(report: report!, description: "\(report!.topic!)\n\(report!.details ?? "")\nדווח על-ידי \(report!.staff!.firstName!) \(report!.staff!.lastName!)")
        self.layer.shadowOpacity = 0.0
        timeLabel.layer.opacity = 0.5
        reportTextView.layer.opacity = 0.5
        UIView.animate(withDuration: 0.2) {
            self.layer.shadowOpacity = 0.5
            self.timeLabel.layer.opacity = 1
            self.reportTextView.layer.opacity = 1
        }
    }
    
    @IBAction func dragExit(_ sender: Any){
        delegate?.cellDragExit(report: report!)
    }
}


protocol FamilyReportCollectionViewCellDelegate {
    func cellTapped(report:FamilyReport, description:String)
    func cellDragExit(report:FamilyReport)
}

