//
//  AddChildSecondViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddChildSecondViewController: MyViewController, UITableViewDataSource, UITableViewDelegate, AlergicTableViewCellDelegate, FoodsTableViewCellDelegate, DiasesMedTableViewCellDelegate {
    
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
    var delegate:AddChildSecondViewControllerDelegate?
    var foodsArr:[Food] = []
    var alergiesArr:[Allergenic] = []
    var medicationsArr:[RoutineMedication] = []
    var diseasesArr:[ChronicDisease] = []
    var foods:Int = 0
    var alergies:Int = 0
    var medications:Int = 0
    var diseases:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTables(tables: [foodsTableView, medicationsTableView, diseasesTableView, alergicTableView])
    }
    
    func initTables(tables:[UITableView]){
        tables.forEach { (table) in
            table.delegate = self
            table.dataSource = self
            table.allowsSelection = false
            table.separatorStyle = .none
            Utility.addBorder(view: table)
        }
    }
    
    //MARK: - Buttons actions
    @IBAction func addChildBtnClicked(_ sender: Any) {
        let loadingView = Utility.getLoadingAlert()
        self.present(loadingView, animated: true, completion: nil)
        if foods != foodsArr.count || alergies != alergiesArr.count || medications != medicationsArr.count || diseases != diseasesArr.count{
            delegate?.shouldEndEditing()
        }
        if foodsArr.count == 0{
            loadingView.dismiss(animated: true) {
                let alert = SimpleAlert(_title: "רק רגע לפני שנמשיך", _message: "נא להוסיף לפחות מזון אחד לילד", dissmissCallback: nil).getAlert()
                self.present(alert, animated: true, completion: nil)
            }
        }
        else if let childData = childData{
            let id = childData["childID"] as! String
            let fName = childData["firstName"] as! String
            let lName = childData["lastName"] as! String
            let gender = childData["gender"] as! String
            let isPre = childData["isPremature"] as! Bool
            let bDay = childData["birthDate"] as! NSDate
            let address = childData["address"] as! String
            let pickup = childData["pickupHour"] as! String
            let child = Child(childID: id, firstName: fName, gender: gender, lastName: lName, isPremature: isPre, birthDate: bDay, isAttend: false, address: address, pickupHour: pickup)
            
            child.foodList = NSSet(array: foodsArr)
            child.allergenics = NSSet(array: alergiesArr)
            child.routineMedication = NSSet(array: medicationsArr)
            child.chronicDiseases = NSSet(array: diseasesArr)
            child.authorized = NSSet(array: childData["AuthorizedAccompanist"] as! [AuthorizedAccompanist])
            
            if let image = childData["image"] as? UIImage{
                Model.instance.saveImageToDisk(imageName: id, image: image)
            }
            
            //WHY IT DOESNT GO BACK TO HOME SCREEN???
            Model.instance.sendToFB(child: child) { (err) in
                if err == nil{
                    loadingView.dismiss(animated: true, completion: {
                        self.unwindHome(self)
                    })
                }
                else{
                    let alert = SimpleAlert(_title: "רק רגע לפני שנמשיך", _message: err!.localizedDescription, dissmissCallback: nil).getAlert()
                    self.present(alert, animated: true, completion: nil)
                }
                /*
                loadingView.dismiss(animated: true, completion: {
                    if err == nil{
                        self.performSegue(withIdentifier: "unwindToMain", sender: nil)
                    }
                    else{
                        let alert = SimpleAlert(_title: "רק רגע לפני שנמשיך", _message: err!.localizedDescription, dissmissCallback: nil).getAlert()
                        self.present(alert, animated: true, completion: nil)
                    }
                })*/
            }
        }
        loadingView.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCellBtnClicked(_ sender: UIButton) {
        delegate?.shouldEndEditing()
        switch sender {
        case addFoodBtn:
            foods += 1
            foodsTableView.beginUpdates()
            foodsTableView.insertRows(at: [IndexPath(row: foods - 1, section: 0)], with: .automatic)
            foodsTableView.endUpdates()
            break
        case addAlergicBtn:
            alergies += 1
            alergicTableView.beginUpdates()
            alergicTableView.insertRows(at: [IndexPath(row: alergies - 1, section: 0)], with: .automatic)
            alergicTableView.endUpdates()
            break
        case addDiseasesBtn:
            diseases += 1
            diseasesTableView.beginUpdates()
            diseasesTableView.insertRows(at: [IndexPath(row: diseases - 1, section: 0)], with: .automatic)
            diseasesTableView.endUpdates()
            break
        case addMedicationBtn:
            medications += 1
            medicationsTableView.beginUpdates()
            medicationsTableView.insertRows(at: [IndexPath(row: medications - 1, section: 0)], with: .automatic)
            medicationsTableView.endUpdates()
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
        switch tableView {
        case foodsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodsTableViewCell
            cell.removeAll()
            cell.delegate = self
            cell.vc = self
            return cell
        case alergicTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "alergicCell", for: indexPath) as! AlergicTableViewCell
            cell.removeAll()
            cell.delegate = self
            cell.vc = self
            return cell
        case diseasesTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "diasesMedCell", for: indexPath) as! DiasesMedTableViewCell
            cell.removeAll()
            cell.delegate = self
            cell.vc = self
            cell.kind = "diseas"
            return cell
        case medicationsTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "diasesMedCell", for: indexPath) as! DiasesMedTableViewCell
            cell.removeAll()
            cell.delegate = self
            cell.vc = self
            cell.kind = "medicine"
            return cell
        default:
            break
        }
        return UITableViewCell(style: .default, reuseIdentifier: nil)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        self.delegate?.shouldEndEditing()
        switch tableView {
        case foodsTableView:
            return [UITableViewRowAction(style: .destructive, title: "מחק", handler: { (action, index) in
                if self.foodsArr.count > 0 && self.foods > 0{
                    if indexPath.row < self.foodsArr.count{
                        self.foodsArr.remove(at: indexPath.row)
                    }
                }
                self.foods -= 1
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            })]
        case alergicTableView:
            return [UITableViewRowAction(style: .destructive, title: "מחק", handler: { (action, index) in
                if self.alergiesArr.count > 0 && self.alergies > 0{
                    if indexPath.row < self.alergiesArr.count{
                        self.alergiesArr.remove(at: indexPath.row)
                    }
                }
                self.alergies -= 1
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            })]
        case diseasesTableView:
            return [UITableViewRowAction(style: .destructive, title: "מחק", handler: { (action, index) in
                if self.diseasesArr.count > 0 && self.diseases > 0{
                    if indexPath.row < self.diseasesArr.count{
                        self.diseasesArr.remove(at: indexPath.row)
                    }
                }
                self.diseases -= 1
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            })]
        case medicationsTableView:
            return [UITableViewRowAction(style: .destructive, title: "מחק", handler: { (action, index) in
                if self.medicationsArr.count > 0 && self.medications > 0{
                    if indexPath.row < self.medicationsArr.count{
                        self.medicationsArr.remove(at: indexPath.row)
                    }
                }
                self.medications -= 1
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.endUpdates()
            })]
        default:
            break
        }
        return nil
    }
    
    //MARK: - Cells delegation
    func alergicData(data: [String : String]) {
        if alergiesArr.count < alergies{
            if data.count == 1{
                if let alergic = data["alergic"]{
                    if alergic != ""{
                        alergiesArr.append(Allergenic(type: alergic, child: nil))
                    }
                }
            }
        }
    }
    
    func foodsData(data: [String : String]) {
        if foodsArr.count < foods{
            if let kind = data["kind"]{
                if let details = data["details"]{
                    //if details != ""{
                    foodsArr.append(Food(type: kind, details: details, child: nil))
                    //}
                }
            }
        }
    }
    
    func diasesData(data: [String : String]) {
        if let kind = data["kind"]{
            if let name = data["name"]{
                if name != ""{
                    if let _ = data["details"]{
                        if kind == "diseas" && diseasesArr.count < diseases{
                            diseasesArr.append(ChronicDisease(type: name, child: nil))
                        }
                        else if kind == "medicine" && medicationsArr.count < medications{
                            medicationsArr.append(RoutineMedication(type: name, child: nil))
                        }
                    }
                }
            }
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

protocol AddChildSecondViewControllerDelegate {
    func shouldEndEditing()
}
