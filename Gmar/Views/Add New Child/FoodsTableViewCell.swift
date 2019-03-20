//
//  FoodsTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {

    //MARK: - Variables
    @IBOutlet weak var kindTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var kindSegment: UISegmentedControl!
    var kindIsHidden = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    //MARK: - Segment
    @IBAction func segmentKindChanged(_ sender: Any) {
        if kindSegment.selectedSegmentIndex == 2{
            kindIsHidden = false
        }
        else{
            kindIsHidden = true
        }
        toggleKindHidness()
    }
    
    func toggleKindHidness(){
        kindTextField.isHidden = kindIsHidden
    }
    
}
