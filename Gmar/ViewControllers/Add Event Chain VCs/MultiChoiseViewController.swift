//
//  MultiChoiseViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class MultiChoiseViewController: MyViewController, UITableViewDelegate, UITableViewDataSource, MultiChoiseCellDelegate {
    
    //MARk: - Variables
    @IBOutlet weak var kidsTableView: UITableView!
    var kids:[Child]?
    var staffID:String?
    
    //MARK: inits
    override func viewDidLoad() {
        super.viewDidLoad()
        kidsTableView.dataSource = self
        kidsTableView.delegate = self
        kidsTableView.allowsSelection = false
        Model.instance.getAllAttendedChildsFromCore { (children) in
            self.kids = children
        }
    }
    
    //MARK: -  TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kids?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MultiChoiseCell") as! MultiChoiseTableViewCell
        let kid = kids![indexPath.row]
        cell.data = "\(kid.firstName!) \(kid.lastName!)"
        cell.child = kid
        cell.indexPath = indexPath
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return []
    }
    
    //Stil need to delete the row properly!
    func cellConfirmBtnClicked(indexPath: IndexPath, child: Child, mealType: String, consumed: String, eventDate: Date, eventType: Int16, cell:MultiChoiseTableViewCell) {
        let loadingAlert = Utility.getLoadingAlert()
        self.present(loadingAlert, animated: true, completion: nil)
        let type = Enums.BasicEvent.init(rawValue: Int(eventType))!
        Model.instance.getStaffByID(staffID: staffID!) { (staff) in
            switch type {
            case .solidFoods:
                let solidFood = SolidFood(mealType: mealType, mealInMenu: nil, amount: nil, consumedAmount: consumed, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                Model.instance.sendToFB(basicEvent: solidFood, callack: { (err) in
                    loadingAlert.dismiss(animated: true, completion: {
                        print("deleting row \(indexPath.row)")
                        self.kidsTableView.beginUpdates()
                        self.kids?.remove(at: indexPath.row)
                        self.kidsTableView.deleteRows(at: [indexPath], with: .left)
                        self.kidsTableView.endUpdates()
                        self.kidsTableView.reloadData()
                    })
                })
                break
            case .tamal, .milk:
                let liquidFood = LiquidFood(mealType: mealType, amount: nil, consumedAmount: consumed, eventType: eventType, eventDate: eventDate as NSDate, child: child, staff: staff)
                Model.instance.sendToFB(basicEvent: liquidFood, callack: { (err) in
                    loadingAlert.dismiss(animated: true, completion: {
                        print("deleting row \(indexPath.row)")
                        self.kidsTableView.beginUpdates()
                        self.kids?.remove(at: indexPath.row)
                        self.kidsTableView.deleteRows(at: [indexPath], with: .left)
                        self.kidsTableView.endUpdates()
                        self.kidsTableView.reloadData()
                    })
                })
                break
            default: break
            }
        }
        loadingAlert.dismiss(animated: true) {
            self.showUnselectedAlert(message: "לא התבצעה שמירה")
        }
    }
    
    func showUnselectedAlert(message: String) {
        let alert = SimpleAlert(_title: "רק רגע", _message: message, dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
}
