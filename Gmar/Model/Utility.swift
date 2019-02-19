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
    
    static var btnBackColor:UIColor?
    
    
    static func addBorder(view:UIView, color:UIColor, width:CGFloat){
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
    }
    
    static func ourBtnDesign(title:String, radius:CGFloat, tag:Int, image:UIImage?,
                             alignment:UIControl.ContentVerticalAlignment = .bottom,
                             type:UIButton.ButtonType = .custom, withBorder:Bool = false)->UIButton{
        let btn = UIButton(type: type)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor(red: 235, green: 235, blue: 235, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "SecularOne-Regular", size: 30)
        btn.titleLabel?.adjustsFontSizeToFitWidth = true
        btn.contentVerticalAlignment = alignment
        btn.backgroundColor = btnBackColor!
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
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: button.titleLabel!.layer.frame.size.height, right: 10)
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
    
    static func newStack(arrangedSubviews: [UIView]) -> UIStackView{
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.alignment = .fill
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }
}
