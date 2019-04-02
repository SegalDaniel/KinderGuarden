//
//  AddChildSecondViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddChildSecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //MARK: - Variables
    @IBOutlet weak var alergicTableView: UITableView!
    @IBOutlet weak var foodsTableView: UITableView!
    @IBOutlet weak var medicationsTableView: UITableView!
    @IBOutlet weak var diseasesTableView: UITableView!
    @IBOutlet weak var addFoodBtn: UIButton!
    @IBOutlet weak var addAlergicBtn: UIButton!
    @IBOutlet weak var addDiseasesBtn: UIButton!
    @IBOutlet weak var addMedicationBtn: UIButton!
    var childData:[String:Any]?
    
    var foods:Int = 0{
        didSet{
            foodsTableView.reloadData()
        }
    }
    var alergies:Int = 0{
        didSet{
            alergicTableView.reloadData()
        }
    }
    var medications:Int = 0{
        didSet{
            medicationsTableView.reloadData()
        }
    }
    var diseases:Int = 0{
        didSet{
            diseasesTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTables(tables: [foodsTableView, medicationsTableView, diseasesTableView, alergicTableView])
        
    }
    
    func initTables(tables:[UITableView]){
        tables.forEach { (table) in
            table.delegate = self
            table.dataSource = self
        }
    }
    
    @IBAction func addCellBtnClicked(_ sender: UIButton) {
        switch sender {
        case addFoodBtn:
            foods += 1
            break
        case addAlergicBtn:
            alergies += 1
            break
        case addDiseasesBtn:
            diseases += 1
            break
        case addMedicationBtn:
            medications += 1
            break
        default:
            break
        }
    }
    
    //MARK: - TableView delegate and datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case foodsTableView:
            return foods
        case alergicTableView:
            return alergies
        case medicationsTableView:
            return medications
        case diseasesTableView:
            return diseases
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        switch tableView {
        case foodsTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodsTableViewCell
            break
        case alergicTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "alergicCell", for: indexPath) as! AlergicTableViewCell
            break
        case diseasesTableView, medicationsTableView:
            cell = tableView.dequeueReusableCell(withIdentifier: "diasesMedCell", for: indexPath) as! DiasesMedTableViewCell
            break
        default:
            break
        }
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
