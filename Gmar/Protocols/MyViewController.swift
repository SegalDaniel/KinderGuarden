//
//  MyViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 18/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let subviews = self.view.subviews
        findAllButtons(subviews: subviews)
    }
    
    func findAllButtons(subviews:[UIView]){
        subviews.forEach { (view) in
            if let btn = view as? UIButton{
                Utility.addShadow(view: btn)
                btn.addTarget(self, action: #selector(removeShadow), for: .touchDown)
                btn.addTarget(self, action: #selector(reAddShadow), for: .touchDragExit)
                btn.addTarget(self, action: #selector(reAddShadow), for: .touchUpInside)
            }
            else{
                findAllButtons(subviews: view.subviews)
            }
        }
    }
    
    @IBAction func removeShadow(_ sender: UIButton) {
        sender.layer.shadowOpacity = 0.0
    }
    
    @IBAction func reAddShadow(_ sender: UIButton) {
        sender.layer.shadowOpacity = 0.5
    }
    

}
