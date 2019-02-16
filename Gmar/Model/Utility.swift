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
    
    static func ourBtnDesign(title:String, radius:CGFloat, tag:Int, withBorder:Bool = false)->UIButton{
        let btn = UIButton(type: .system)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor(red: 235, green: 235, blue: 235, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "SecularOne-Regular", size: 25)
        btn.contentVerticalAlignment = .bottom
        btn.backgroundColor = btnBackColor!
        btn.layer.cornerRadius = radius
        btn.clipsToBounds = true
        btn.tag = tag
        if withBorder{
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.borderWidth = 2
        }
        return btn
    }
}
