//
//  AddChildSecondViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddChildSecondViewController: UIViewController {

    //MARK: - Variables
    @IBOutlet weak var alergicTableView: UITableView!
    @IBOutlet weak var foodsTableView: UITableView!
    @IBOutlet weak var medicationsTableView: UITableView!
    @IBOutlet weak var diseasesTableView: UITableView!
    @IBOutlet weak var addFoodBtn: UIButton!
    @IBOutlet weak var addAlergicBtn: UIButton!
    @IBOutlet weak var addDiseasesBtn: UIButton!
    @IBOutlet weak var addMedicationBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCellBtnClicked(_ sender: UIButton) {
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
