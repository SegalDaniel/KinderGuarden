//
//  MultiChoiseViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class MultiChoiseViewController: GenericVC, UITableViewDelegate, UITableViewDataSource, MultiChoiseCellDelegate {

    @IBOutlet weak var finalConfirmBtn: UIButton!
    @IBOutlet weak var kidNameTitle: UILabel!
    @IBOutlet weak var foodKindTitle: UILabel!
    @IBOutlet weak var quantityTitle: UILabel!
    @IBOutlet weak var kidsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kidsTableView.dataSource = self
        kidsTableView.delegate = self
        kidsTableView.allowsSelection = false
        initViews(labels: [kidNameTitle, foodKindTitle, quantityTitle])
    }
    
    /* TableView Methods */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MultiChoiseCell") as! MultiChoiseTableViewCell
        cell.data = "שם של ילד"
        Utility.addBorder(view: cell, color: UIColor.black, width: 1)
        cell.delegate = self
        return cell
    }
    
    func cellConfirmBtnClicked() {
        
    }
    
    @IBAction func finalConfirmBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
    }
    

    func initViews(labels:[UILabel]){
        labels.forEach { (label) in
            Utility.addBorder(view: label, color: UIColor.black, width: 2)
        }
    }
}
