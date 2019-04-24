//
//  KeyboardMovment.swift
//  Gmar
//
//  Created by Zach Bachar on 23/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

extension Utility{
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
