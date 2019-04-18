//
//  AlergicTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AlergicTableViewCell: UITableViewCell, UITextFieldDelegate, AddChildSecondViewControllerDelegate {

    //MARK: - Variables
    @IBOutlet weak var nameTextField: UITextField!
    var delegate:AlergicTableViewCellDelegate?
    var vc:AddChildSecondViewController?{
        didSet{
            vc!.delegate = self
            Utility.removeMoveWithKeyboard(viewController: vc!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameTextField.delegate = self
        Utility.ourTextFieldDesign(textFiled: nameTextField)
    }
    
    func removeAll(){
        nameTextField.isEnabled = true
        nameTextField.text = ""
    }
    
    func shouldEndEditing(){
        var data:[String:String] = [:]
        data["alergic"] = nameTextField.text!
        nameTextField.isEnabled = false
        delegate?.alergicData(data: data)
    }

}
//MARK: - AlergicTableViewCellDelegate protocol
protocol AlergicTableViewCellDelegate {
    func alergicData(data:[String:String])
}
