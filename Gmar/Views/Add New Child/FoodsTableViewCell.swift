//
//  FoodsTableViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class FoodsTableViewCell: UITableViewCell, UITextFieldDelegate, AddChildSecondViewControllerDelegate {
    
    //MARK: - Variables
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var kindSegment: UISegmentedControl!
    var textIsHidden = true
    var delegate:FoodsTableViewCellDelegate?
    var vc:AddChildSecondViewController?{
        didSet{
            vc!.delegate = self
            Utility.removeMoveWithKeyboard(viewController: vc!)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        amountTextField.delegate = self
    }
    
    func removeAll(){
        amountTextField.isEnabled = true
        kindSegment.isEnabled = true
        kindSegment.selectedSegmentIndex = 0
        amountTextField.text = ""
        textIsHidden = true
    }
    
    //MARK: - Segment
    @IBAction func segmentKindChanged(_ sender: Any) {
        changePlaceHolder()
        toggleKindHidness()
    }
    
    func changePlaceHolder(){
        if kindSegment.selectedSegmentIndex == 0{
            amountTextField.placeholder = "העדפות"
        }
        else{
            amountTextField.placeholder = "סוג"
        }
    }
    
    func toggleKindHidness(){
        if kindSegment.selectedSegmentIndex == 1{
            textIsHidden = true
        }
        else{
            textIsHidden = false
        }
        amountTextField.isHidden = textIsHidden
    }
    
    func shouldEndEditing() {
        kindSegment.isEnabled = false
        var data:[String:String] = [:]
        switch kindSegment.selectedSegmentIndex {
        case 0:
            data["kind"] = "solid"
            data["details"] = amountTextField.text!
            break
        case 1:
            data["kind"] = "milk"
            data["details"] = ""
            break
        case 2:
            data["kind"] = "tamal"
            data["details"] = amountTextField.text!
            break
        default:
            break
        }
        amountTextField.isEnabled = false
        delegate?.foodsData(data: data)
    }
    
}

protocol FoodsTableViewCellDelegate {
    func foodsData(data:[String:String])
}
