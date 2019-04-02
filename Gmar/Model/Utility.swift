//
//  Utility.swift
//  Gmar
//
//  Created by Zach Bachar on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit
import Foundation

class Utility{
    
    //MARK: - App colors
    static let btnBackColor:UIColor = UIColor(red: 0/255, green: 114/255, blue: 188/255, alpha: 1)
    static let btnGray:UIColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
    static let btnSalmon:UIColor = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1)
    static let btnTextWhite:UIColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
    
    //MARK: - Design views methods
    static func addBorder(view:UIView, color:UIColor, width:CGFloat = 2){
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = width
    }
    
    static func ourBtnDesign(title:String, radius:CGFloat, tag:Int, image:UIImage?,
                             alignment:UIControl.ContentVerticalAlignment = .bottom,
                             type:UIButton.ButtonType = .custom, withBorder:Bool = false)->UIButton{
        let btn = UIButton(type: type)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(btnTextWhite, for: .normal)
        btn.titleLabel?.font = UIFont(name: "SecularOne-Regular", size: 30)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.contentVerticalAlignment = alignment
        btn.backgroundColor = btnBackColor
        btn.layer.cornerRadius = radius
        btn.clipsToBounds = true
        btn.tag = tag
        if image != nil{
            btn.setImage(image, for: .normal)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -btn.imageView!.image!.size.width, bottom: 0, right: 0)
            btn.imageView?.contentMode = .scaleAspectFit
            btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: btn.titleLabel!.frame.size.height, right: 0)
        }
        if withBorder{
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.borderWidth = 2
        }
        return btn
    }
    
    static func adjustBtnTitle(button:UIButton){
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.imageView?.contentMode = .scaleAspectFit
        button.titleEdgeInsets = UIEdgeInsets(top: 5, left: -button.imageView!.image!.size.width, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: button.titleLabel!.layer.frame.size.height+15, right: 10)
    }
    
    static func ourLabelDesign(frame:CGRect, text:String = "") -> UILabel{
        let label = PaddingLabel(frame: frame)
        label.font = UIFont(name: "VarelaRound-Regular", size: 30)
        label.textColor = btnBackColor
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.borderWidth = 2
        label.adjustsFontSizeToFitWidth = true
        label.text = text
        label.textAlignment = .center
        return label
    }
    
    //MARK: - generic stack methods
    static func newStack(arrangedSubviews: [UIView]) -> UIStackView{
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.alignment = .fill
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.tag = 0
        return stack
    }
    
    static func newStack(frame:CGRect) -> UIStackView{
        let stack = UIStackView(frame: frame)
        stack.alignment = .fill
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.tag = 0
        return stack
    }
    
    //MARK: - TapRecognizer metod
    static func viewTapRecognizer(target:Any, toBeTapped:UIView, action:Selector){
        let tapGestureRecognizer = UITapGestureRecognizer(target: target, action: action)
        toBeTapped.isUserInteractionEnabled = true
        toBeTapped.addGestureRecognizer(tapGestureRecognizer)
    }
    
     static func viewLongPressRecognizer(target:Any, toBeTapped:UIView, action:Selector){
        let longPressRecognizer = UILongPressGestureRecognizer(target: target, action: action)
        toBeTapped.isUserInteractionEnabled = true
        toBeTapped.addGestureRecognizer(longPressRecognizer)
    }
    
    //MARK: - Keyboard movment
    static func moveWithKeyboard(viewController:UIViewController){
        NotificationCenter.default.addObserver(viewController, selector: #selector(viewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(viewController, selector: #selector(viewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    static func removeMoveWithKeyboard(viewController:UIViewController){
        NotificationCenter.default.removeObserver(viewController, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(viewController, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

//MARK: - Double extension
extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

//MARK: - ViewController extension for keyboard
extension UIViewController{
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
