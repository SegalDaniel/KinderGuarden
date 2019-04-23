//
//  DesignViewsHelper.swift
//  Gmar
//
//  Created by Zach Bachar on 23/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

extension Utility{
    //MARK: - Design views methods
    private static func addView(superView:UIView, constraintTop top:UIView, constraintLeading lead:UIView, constraintTrailing trail:UIView, constraintBottom bottom:UIView, constant const:CGFloat) -> UIView{
        let view = UIView()
        superView.addSubview(view)
        view.isUserInteractionEnabled = false
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: top, attribute: .top, multiplier: 1, constant: -const).isActive = true
        NSLayoutConstraint(item: view, attribute: .leading, relatedBy: .equal, toItem: lead, attribute: .leading, multiplier: 1, constant: -const).isActive = true
        NSLayoutConstraint(item: view, attribute: .trailing, relatedBy: .equal, toItem: trail, attribute: .trailing, multiplier: 1, constant: const).isActive = true
        NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: bottom, attribute: .bottom, multiplier: 1, constant: const).isActive = true
        return view
    }
    
    static func addBackground(superView:UIView, constraintTop top:UIView, constraintLeading lead:UIView, constraintTrailing trail:UIView, constraintBottom bottom:UIView, backgroundColor color:UIColor, constant const:CGFloat){
        let back = addView(superView: superView, constraintTop: top, constraintLeading: lead, constraintTrailing: trail, constraintBottom: bottom, constant: const)
        back.backgroundColor = color
        back.layer.cornerRadius = 10
    }
    
    static func addBorder(superView:UIView, constraintTop top:UIView, constraintLeading lead:UIView, constraintTrailing trail:UIView, constraintBottom bottom:UIView, constant const:CGFloat, color:UIColor = UIColor.white) -> UIView{
        let borderView = addView(superView: superView, constraintTop: top, constraintLeading: lead, constraintTrailing: trail, constraintBottom: bottom, constant: const)
        addBorder(view: borderView, color: color)
        return borderView
    }
    
    static func addBorder(view:UIView, radius:CGFloat = 10, color:UIColor = UIColor.white, width:CGFloat = 2){
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
        view.layer.cornerRadius = radius
    }
    
    static func addShadow(view:UIView){
        view.layer.shadowRadius = 5
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width:0, height:1)
        view.layer.masksToBounds = false
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
        addShadow(view: btn)
        if image != nil{
            btn.setImage(image, for: .normal)
            btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -btn.imageView!.image!.size.width, bottom: 0, right: 0)
            btn.imageView?.clipsToBounds = true
            btn.imageView?.contentMode = .scaleAspectFit
            btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: btn.titleLabel!.frame.size.height, right: 0)
        }
        if withBorder{
            addBorder(view: btn, color: UIColor.white)
        }
        return btn
    }
    
    static func adjustBtnTitle(button:UIButton){
        //addBorder(view: button)
        addShadow(view: button)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.imageView?.contentMode = .scaleAspectFit
        button.titleEdgeInsets = UIEdgeInsets(top: 5, left: -button.imageView!.image!.size.width, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: button.titleLabel!.layer.frame.size.height+15, right: 10)
    }
    
    static func ourLabelDesign(frame:CGRect, text:String = "") -> UILabel{
        let label = PaddingLabel(frame: frame)
        label.font = UIFont(name: "VarelaRound-Regular", size: 30)
        label.textColor = btnTextWhite
        addBorder(view: label)
        label.adjustsFontSizeToFitWidth = true
        label.text = text
        label.textAlignment = .center
        return label
    }
    
    static func adjustLabelDesign(label:UILabel){
        label.textColor = btnTextWhite
        addBorder(view: label)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
    }
    
    static func ourTextFieldDesign(textFiled:UITextField){
        textFiled.backgroundColor = BackgroundBlueColor
        textFiled.tintColor = btnTextWhite
        textFiled.textColor = btnTextWhite
        addBorder(view: textFiled)
        textFiled.clipsToBounds = true
        let placeholder = textFiled.placeholder
        if let txt = placeholder{
            textFiled.attributedPlaceholder = NSAttributedString(string: txt,
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
        }
    }
}
