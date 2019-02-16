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
    
    static func addBtnToStack(vc:UIViewController ,title:String, tag:Int, stack:UIStackView, action:Selector, radius:CGFloat, withBorder:Bool, backgroundColor:UIColor = UIColor.blue){
        let btn = UIButton(type: .system)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor(red: 235, green: 235, blue: 235, alpha: 1), for: .normal)
        btn.titleLabel?.font = UIFont(name: "SecularOne-Regular", size: 25)
        btn.contentVerticalAlignment = .bottom
        btn.backgroundColor = backgroundColor
        btn.layer.cornerRadius = radius
        btn.clipsToBounds = true
        btn.tag = tag
        if withBorder{
            btn.layer.borderColor = UIColor.black.cgColor
            btn.layer.borderWidth = 2
        }
        btn.addTarget(vc, action: action, for: .touchUpInside)
        stack.addArrangedSubview(btn)
    }
    
}
