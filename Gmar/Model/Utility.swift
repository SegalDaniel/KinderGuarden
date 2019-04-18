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
    //static let BackgroundBlueColor:UIColor = UIColor(red: 48/255, green: 112/255, blue: 182/255, alpha: 1)
    static let btnBackColor:UIColor = UIColor(red: 0/255, green: 114/255, blue: 188/255, alpha: 1)
    static let btnGray:UIColor = UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1)
    static let btnSalmon:UIColor = UIColor(red: 255/255, green: 126/255, blue: 121/255, alpha: 1)
    static let btnTextWhite:UIColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1)
    static let btnPink:UIColor = UIColor(red: 255/255, green: 133/255, blue: 255/255, alpha: 1)
    
    //MARK: - Design views methods
    static func addBorder(view:UIView, color:UIColor = UIColor.white, width:CGFloat = 2){
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = width
        view.layer.cornerRadius = 10
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
                             type:UIButton.ButtonType = .custom, withBorder:Bool = true)->UIButton{
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
    
    static func ourTextFieldDesign(textFiled:UITextField){
        textFiled.backgroundColor = btnBackColor
        textFiled.tintColor = btnTextWhite
        textFiled.textColor = btnTextWhite
        addBorder(view: textFiled)
        let placeholder = textFiled.placeholder
        if let txt = placeholder{
            textFiled.attributedPlaceholder = NSAttributedString(string: txt,
                                                                 attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightText])
        }
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
    
    //MARK: - Loading Alert
    static func getLoadingAlert(message:String = "שומר..") ->UIAlertController{
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        return alert
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

public class EdgeShadowLayer: CAGradientLayer {
    
    public enum Edge {
        case Top
        case Left
        case Bottom
        case Right
    }
    
    public init(forView view: UIView,
                edge: Edge = Edge.Top,
                shadowRadius radius: CGFloat = 20.0,
                toColor: UIColor = UIColor.white,
                fromColor: UIColor = UIColor.black) {
        super.init()
        self.colors = [fromColor.cgColor, toColor.cgColor]
        self.shadowRadius = radius
        
        let viewFrame = view.frame
        
        switch edge {
        case .Top:
            startPoint = CGPoint(x: 0.5, y: 0.0)
            endPoint = CGPoint(x: 0.5, y: 1.0)
            self.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: shadowRadius)
        case .Bottom:
            startPoint = CGPoint(x: 0.5, y: 1.0)
            endPoint = CGPoint(x: 0.5, y: 0.0)
            self.frame = CGRect(x: 0.0, y: viewFrame.height - shadowRadius, width: viewFrame.width, height: shadowRadius)
        case .Left:
            startPoint = CGPoint(x: 0.0, y: 0.5)
            endPoint = CGPoint(x: 1.0, y: 0.5)
            self.frame = CGRect(x: 0.0, y: 0.0, width: shadowRadius, height: viewFrame.height)
        case .Right:
            startPoint = CGPoint(x: 1.0, y: 0.5)
            endPoint = CGPoint(x: 0.0, y: 0.5)
            self.frame = CGRect(x: viewFrame.width - shadowRadius, y: 0.0, width: shadowRadius, height: viewFrame.height)
        }
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIButton{
    
    
    
}
