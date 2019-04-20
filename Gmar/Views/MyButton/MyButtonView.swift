//
//  MyButtonView.swift
//  Gmar
//
//  Created by Zach Bachar on 20/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class MyButtonView: UIView {

    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    var isEnabled:Bool = true{
        didSet{
            mainButton.isEnabled = self.isEnabled
            if !self.isEnabled{
                removeShadow(0)
                mainImageView.layer.opacity = 0.5
                mainLabel.layer.opacity = 0.5
            }
            else{
                reAddShadow(0)
                mainImageView.layer.opacity = 1
                mainLabel.layer.opacity = 1
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init(frame:CGRect, title:String, radius:CGFloat, tag:Int, image:UIImage){
        self.init(frame: frame)
        self.setTitle(title: title)
        self.addRadius(radius: radius)
        self.addTag(tag: tag)
        self.setImage(image: image)
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("MyButton", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        Utility.addShadow(view: contentView)
        mainButton.layer.cornerRadius = 10
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = Utility.btnBackColor
        mainImageView.layer.cornerRadius = 10
        mainImageView.clipsToBounds = true
        mainButton.layer.zPosition = 1
        mainLabel.clipsToBounds = true
        mainButton.addTarget(self, action: #selector(removeShadow), for: .touchDown)
        mainButton.addTarget(self, action: #selector(reAddShadow), for: .touchDragExit)
        mainButton.addTarget(self, action: #selector(reAddShadow), for: .touchUpInside)
    }
    
    func setImage(image:UIImage){
        mainImageView.image = image
    }
    
    func addTarget(_ target: Any?, action: Selector, for event: UIControl.Event){
        mainButton.addTarget(target, action: action, for: event)
    }
    
    func addRadius(radius:CGFloat){
        contentView.layer.cornerRadius = radius
        mainButton.layer.cornerRadius = radius
        mainImageView.layer.cornerRadius = radius
    }
    
    func setBackgroundColor(color:UIColor){
        contentView.backgroundColor = color
    }
    
    func addTag(tag:Int){
        mainButton.tag = tag
    }
    
    func setTitle(title:String?){
        mainLabel.text = title
    }
    
    @IBAction func removeShadow(_ sender: Any) {
        contentView.layer.shadowOpacity = 0.0
    }
    
    @IBAction func reAddShadow(_ sender: Any) {
        contentView.layer.shadowOpacity = 0.5
    }
}


