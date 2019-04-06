//
//  DiasesMedTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class DiasesMedTableViewCell: UITableViewCell, UITextFieldDelegate, AddChildSecondViewControllerDelegate {

    //MARK: - Variables
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailsTextField: UITextField!
    var kind:String?
    var delegate:DiasesMedTableViewCellDelegate?
    var vc:AddChildSecondViewController?{
        didSet{
            vc!.delegate = self
            Utility.moveWithKeyboard(viewController: vc!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nameTextField.delegate = self
        detailsTextField.delegate = self
    }
    
    func removeAll(){
        nameTextField.isEnabled = true
        detailsTextField.isEnabled = true
        nameTextField.text = ""
        detailsTextField.text = ""
        kind = nil
    }

    
    func shouldEndEditing(){
        var data:[String:String] = [:]
        data["kind"] = kind!
        data["name"] = nameTextField.text!
        data["details"] = detailsTextField.text!
        nameTextField.isEnabled = false
        detailsTextField.isEnabled = false
        delegate?.diasesData(data: data)
    }

}
//MARK: - DiasesMedTableViewCellDelegate protocol
protocol DiasesMedTableViewCellDelegate {
    func diasesData(data:[String:String])
}
