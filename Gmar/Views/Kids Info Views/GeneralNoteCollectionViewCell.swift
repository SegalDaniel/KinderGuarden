//
//  GeneralNoteCollectionViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class GeneralNoteCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var timeLabel: UILabel!
    var note:GeneralNote?
    var delegate:GeneralNoteCollectionViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Utility.btnBackColor
        self.layer.cornerRadius = 10
        Utility.addShadow(view: self)
        Utility.viewTapRecognizer(target: self, toBeTapped: noteTextView, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: timeLabel, action: #selector(tapped))
        Utility.viewTapRecognizer(target: self, toBeTapped: self, action: #selector(tapped))
        
        Utility.viewPanRecognizer(target: self, toBeTapped: noteTextView, action: #selector(dragExit))
        Utility.viewPanRecognizer(target: self, toBeTapped: timeLabel, action: #selector(dragExit))
        Utility.viewPanRecognizer(target: self, toBeTapped: self, action: #selector(dragExit))
        if note != nil{
            initEvent()
        }
        
    }
    
    func initEvent(){
        let date = note!.eventDate!
        let time = DateAdmin.extractDateAndTime(date: date as Date, dateStyle: .none)
        timeLabel.text = time
        noteTextView.text = "\(note!.details!)"
    }
    
    @IBAction func tapped(_ sender: Any){
        delegate?.cellTapped(note: note!, description: "\(note!.details!)\nדווח על-ידי \(note!.staff!.firstName!) \(note!.staff!.lastName!)")
        self.layer.shadowOpacity = 0.0
        timeLabel.layer.opacity = 0.5
        noteTextView.layer.opacity = 0.5
        UIView.animate(withDuration: 0.2) {
            self.layer.shadowOpacity = 0.5
            self.timeLabel.layer.opacity = 1
            self.noteTextView.layer.opacity = 1
        }
    }
    
    @IBAction func dragExit(_ sender: Any){
        delegate?.cellDragExit(note: note!)
    }
}


protocol GeneralNoteCollectionViewCellDelegate {
    func cellTapped(note:GeneralNote, description:String)
    func cellDragExit(note:GeneralNote)
}
