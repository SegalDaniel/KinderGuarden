//
//  KidCollectionViewCell.swift
//  Gmar
//
//  Created by Zach Bachar on 26/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class KidCollectionViewCell: UICollectionViewCell {
    
    var child:Child?
    var delegate:KidCollectionViewCellDelegate?
    @IBOutlet weak var kidButton: MyButtonView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initButton()
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 10
    }
    
    func initButton(){
        if let child = child {
            kidButton.addTag(tag: Int(child.childID!)!)
            kidButton.addRadius(radius: 10)
            if let image = Model.instance.loadImageFromDiskWith(fileName: child.childID!){
                    kidButton.setImage(image: image)
            }
            else{
                kidButton.setImage(image: UIImage(named: "001-baby-6")!)
            }
            kidButton.setTitle(title: "\(child.firstName!) \(child.lastName!)")
            if child.gender == "girl"{
                kidButton.setBackgroundColor(color: Utility.btnPink)
            }
            kidButton.addTarget(self, action: #selector(tapped), for: .touchUpInside)
            //kidButton.addTarget(self, action: #selector(dragExit), for: .touchDragExit)
        }
    }
    
    override func prepareForReuse() {
        kidButton.isEnabled = true
        if let child = child{
            if child.gender == "girl"{
                kidButton.setBackgroundColor(color: Utility.btnPink)
            }
            else{
                kidButton.setBackgroundColor(color: Utility.btnBackColor)
            }
        }
    }
    
    @IBAction func tapped(_ sender: Any){
        delegate?.kidCellTapped(child: child!)
    }
    
    @IBAction func dragExit(_ sender: Any){
        delegate?.kidCellDragExit(child: child!)
    }
}

protocol KidCollectionViewCellDelegate {
    func kidCellTapped(child:Child)
    func kidCellDragExit(child:Child)
}
