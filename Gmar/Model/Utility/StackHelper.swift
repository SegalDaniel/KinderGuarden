//
//  StackHelper.swift
//  Gmar
//
//  Created by Zach Bachar on 23/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

extension Utility{
    //MARK: - generic stack methods
    static func newStack(arrangedSubviews: [UIView]) -> UIStackView{
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.alignment = .fill
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.tag = 0
        return stack
    }
    
    static func newStack(frame:CGRect) -> UIStackView{
        let stack = UIStackView(frame: frame)
        stack.alignment = .fill
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.tag = 0
        return stack
    }
}
