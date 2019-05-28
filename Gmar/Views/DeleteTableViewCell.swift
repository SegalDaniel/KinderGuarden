//
//  DeleteTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 25/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class DeleteTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    var name:String?{
        didSet{
            if nameLabel != nil && name != nil{
                nameLabel.text = name!
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let name = name{
            nameLabel.text = name
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
