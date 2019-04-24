//
//  TapGestures.swift
//  Gmar
//
//  Created by Zach Bachar on 23/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

extension Utility{
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
}
