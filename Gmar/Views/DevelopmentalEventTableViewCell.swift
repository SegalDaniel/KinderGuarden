//
//  DevelopmentalEventTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 17/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class DevelopmentalEventTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var eventLabal: UILabel!
    var section:Int?
    var row:Int?
    var eventType:Int?
    var eventTitle:String?{
        didSet{
            if eventLabal != nil{
                eventLabal.text = eventTitle
            }
        }
    }
    var delegate:DevelopmentalEventTableViewCellDelegate?
    var checked:Bool = false{
        didSet{
            adjustCheckMark()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let title = eventTitle{
            eventLabal.text = title
        }
        adjustCheckMark()
    }
    
    override func prepareForReuse() {
        adjustCheckMark()
    }
    
    @IBAction func checkBtnPressed(_ sender: Any) {
        checked = !checked
        adjustCheckMark()
        delegate?.checked(eventType: eventType!)
    }
    
    func adjustCheckMark(){
        switch checked {
        case true:
            checkBtn.setImage(UIImage(named: "check-pressed"), for: .normal)
            break
        case false:
            checkBtn.setImage(UIImage(named: "check"), for: .normal)
            break
        }
    }
}

protocol DevelopmentalEventTableViewCellDelegate {
    func checked(eventType:Int)
}
