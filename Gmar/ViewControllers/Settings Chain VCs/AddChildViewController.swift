//
//  AddChildViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddChildViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: - Variables
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var babyImageView: UIImageView!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var addChildPickerBtn: UIButton!
    @IBOutlet weak var pickingTimePicker: UIDatePicker!
    @IBOutlet weak var childPickerTableView: UITableView!
    @IBOutlet weak var childIDTextField: UITextField!
    
    var pickers:Int = 0{
        didSet{
            if childPickerTableView != nil{
                childPickerTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childPickerTableView.delegate = self
        childPickerTableView.dataSource = self
    }
    

    //MARK: - Button action
    @IBAction func addPickerBtnClicked(_ sender: Any) {
        pickers += 1
    }
    
    
    //MARK: - child picker table view delegate & datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "childPicker", for: indexPath) as! ChildPickerTableViewCell
        
        return cell
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
