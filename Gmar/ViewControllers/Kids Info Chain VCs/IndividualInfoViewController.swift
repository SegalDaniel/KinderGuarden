//
//  IndividualInfoViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 22/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class IndividualInfoViewController: UIViewController {

    var childID:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(childID ?? "no childID")
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
