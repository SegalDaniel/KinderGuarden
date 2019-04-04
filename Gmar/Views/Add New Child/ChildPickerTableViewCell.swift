//
//  ChildPickerTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class ChildPickerTableViewCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, AddChildViewControllerDelegate {
    
    //MARK: - Variables
    @IBOutlet weak var pickerNameTextField: UITextField!
    @IBOutlet weak var pickerKindPicker: UIPickerView!
    @IBOutlet weak var pickerPhoneTextField: UITextField!
    var possPickers = ["אמא", "אבא", "סבא", "סבתא", "אח/ות", "אחר"]
    var delegate:ChildPickerTableViewCellDelegate?
    var row = 0
    var vc:AddChildViewController?{
        didSet{
            vc!.delegate = self
            Utility.moveWithKeyboard(viewController: vc!)
        }
    }
    
    //MARK: - Cell overrides
    override func awakeFromNib() {
        super.awakeFromNib()
        pickerNameTextField.delegate = self
        pickerPhoneTextField.delegate = self
        pickerKindPicker.delegate = self
        pickerKindPicker.dataSource = self
    }
    
    func removeAll(){
        pickerNameTextField.isEnabled = true
        pickerPhoneTextField.isEnabled = true
        pickerKindPicker.isUserInteractionEnabled = true
        pickerKindPicker.selectRow(0, inComponent: 0, animated: false)
        row = 0
        pickerNameTextField.text = ""
        pickerPhoneTextField.text = ""
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //delegate?.relation(relation: possPickers[row])
        self.row = row
    }
    
    func shouldEndEditing() {
        var data:[String:String] = [:]
        data["name"] = pickerNameTextField.text!
        data["phone"] = pickerPhoneTextField.text!
        data["relation"] = possPickers[row]
        pickerNameTextField.isEnabled = false
        pickerPhoneTextField.isEnabled = false
        pickerKindPicker.isUserInteractionEnabled = false
        delegate?.authData(data: data)
    }
}

//MARK: - ChildPickerTableViewCellDelegate protocol
protocol ChildPickerTableViewCellDelegate {
    func authData(data:[String:String])
}
