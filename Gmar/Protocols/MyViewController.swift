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
        addHomeButton()
        navigationTitleFont()
    }
    
    func navigationTitleFont(){
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.font: UIFont(name: "SecularOne-Regular", size: 21)!]
    }
    
    func addHomeButton(){
        let height = self.navigationController!.navigationBar.frame.height
        let frame = CGRect(x: 0, y: 0,width: height*0.8, height: height*0.8)
        let containView = UIView(frame: frame)
        let btn = UIButton(frame: frame)
        btn.setImage(UIImage(named: "home"), for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        btn.addTarget(self, action: #selector(unwindHome), for: .touchUpInside)
        containView.addSubview(btn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: containView)
    }
    
    func findAllButtons(subviews:[UIView]){
        subviews.forEach { (view) in
            if let btn = view as? UIButton{
                Utility.addShadow(view: btn)
                btn.layer.cornerRadius = 10
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
    
     @IBAction func unwindHome(_ sender: Any){
        let homeVC:UIViewController = (self.navigationController?.viewControllers[0])!
        self.navigationController?.setViewControllers([homeVC], animated: true)
    }
    

}
