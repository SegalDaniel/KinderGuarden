//
//  HeartRateTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 09/06/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class HeartRateTableViewCell: UITableViewCell {

    @IBOutlet weak var pulseLabel: UILabel!
    @IBOutlet weak var heartImageView: UIImageView!
    var animated:Bool = false
    var pulse:Int?{
        didSet{
            if let label = pulseLabel{
                label.text = "\(pulse!)"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let pulse = pulse{
            pulseLabel.text = "\(pulse)"
        }
    }
    
    override func prepareForReuse() {
        animated = true
    }
}
