//
//  DeleteViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 25/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class DeleteViewController: MyViewController {

    //MARK: - Variables
    @IBOutlet weak var deleteTableView: UITableView!
    let sectionTitles:[String] = ["ילדים", "אנשי צוות"]
    var kids:[Child] = []{
        didSet{
            deleteTableView.reloadData()
        }
    }
    var staff:[Staff] = []{
        didSet{
            deleteTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        initEntities()
    }
    
    func initEntities(){
        Model.instance.getStaffFromDB { (staffArr) in
            self.staff = staffArr
        }
        Model.instance.getAllChildsFromCore { (childArr) in
            self.kids = childArr
        }
    }
}

extension DeleteViewController: UITableViewDelegate, UITableViewDataSource{
    
    func initTableView(){
        deleteTableView.delegate = self
        deleteTableView.dataSource = self
        deleteTableView.allowsSelection = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return kids.count
        }
        return staff.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deleteCell") as! DeleteTableViewCell
        switch indexPath.section {
        case 0:
            cell.name = "\(kids[indexPath.row].firstName!) \(kids[indexPath.row].lastName!)"
            break
        case 1:
            cell.name = "\(staff[indexPath.row].firstName!) \(staff[indexPath.row].lastName!)"
            break
        default:
            break
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.font = UIFont(name: "SecularOne-Regular", size: 30)
        label.textColor = Utility.btnTextWhite
        label.text = sectionTitles[section]
        label.textAlignment = .right
        headerView.addSubview(label)
        headerView.backgroundColor = Utility.btnBackColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "מחק") { (action, indexPath) in
            let loading = Utility.getLoadingAlert(message: "מוחק..")
            self.present(loading, animated: true, completion: nil)
            tableView.beginUpdates()
            switch indexPath.section{
            case 0:
                Model.instance.deleteChildFromDB(childID: self.kids[indexPath.row].childID!, callback: { (err) in
                    loading.dismiss(animated: true, completion: {
                        self.kids.remove(at: indexPath.row)
                        DispatchQueue.main.async {
                            tableView.deleteRows(at: [indexPath], with: .automatic)
                            tableView.endUpdates()
                        }
                    })
                })
                break
            case 1:
                Model.instance.deleteStaffFromDB(staffID: self.staff[indexPath.row].staffID!, callback: { (err) in
                    loading.dismiss(animated: true, completion: {
                        self.kids.remove(at: indexPath.row)
                        DispatchQueue.main.async {
                            tableView.deleteRows(at: [indexPath], with: .automatic)
                            tableView.endUpdates()
                        }
                    })
                })
                break
            default:
                break
            }
        }
        return [delete]
    }
}
