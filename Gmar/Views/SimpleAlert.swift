//
//  SimpleAlert.swift
//  Gmar
//
//  Created by Zach Bachar on 30/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import Foundation
import UIKit

class SimpleAlert{
    private let alert:UIAlertController
    
    init(_title:String, _message:String, dissmissCallback:((() -> Void))?){
        alert = UIAlertController( title: _title, message: _message, preferredStyle: .alert )
        let dissmisAction = UIAlertAction(title: "Dissmis", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
            dissmissCallback?()
            self.alert.dismiss(animated: true, completion: nil)
        })
        alert.addAction(dissmisAction)
    }
    
    func getAlert() -> UIAlertController{
        return alert
    }
}
