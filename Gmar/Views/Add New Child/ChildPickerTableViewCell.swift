//
//  ChildPickerTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class ChildPickerTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: - Variables
    @IBOutlet weak var pickerNameTextField: UITextField!
    @IBOutlet weak var pickerKindPicker: UIPickerView!
    @IBOutlet weak var pickerPhoneTextField: UITextField!
    var possPickers = ["אמא", "אבא", "סבא", "סבתא", "אח/ות", "אחר"]
    
    //MARK: - Cell overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerKindPicker.delegate = self
        pickerKindPicker.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - UIPickerView delegate and datasource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return possPickers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return possPickers[row]
    }
}

//MARK: - ChildPickerTableViewCellDelegate protocol
protocol ChildPickerTableViewCellDelegate {
    func pickers(amount:Int)
}
