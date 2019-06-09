//
//  DevelopmentalEventViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 17/05/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class DevelopmentalEventViewController: GenericVC {

    //MARK: - Variables
    @IBOutlet weak var eventsTableView: UITableView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var timeBtn: UIButton!
    let dataSource = DevelopmentalEventsDataSource()
    var checkedCells:[Int:Bool] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventsTableView.dataSource = self
        eventsTableView.delegate = self
        timeBtn.setTitle(currentDate(), for: .normal)
        Utility.addBorder(view: eventsTableView)
        eventsTableView.allowsSelection = false
        initCheckedCells()
    }
    
    func initCheckedCells(){
        for i in 0...dataSource.grossMotor.count{
            checkedCells[100 + i] = false
        }
        for i in 0...dataSource.fineMotor.count{
            checkedCells[200 + i] = false
        }
        for i in 0...dataSource.social.count{
            checkedCells[300 + i] = false
        }
        for i in 0...dataSource.language.count{
            checkedCells[400 + i] = false
        }
    }
    
    //MARK: - buttons actions
    @IBAction func timeBtnClicked(_ sender: Any) {
        showDatePicker(timeStyle: .short, dateStyle: .medium) { (dateString, time, date) in
            self.timeBtn.setTitle(dateString, for: .normal)
        }
    }
    
    @IBAction func confirmBtnClicked(_ sender: Any) {
        let loadingAlert = Utility.getLoadingAlert()
        self.present(loadingAlert, animated: true, completion: nil)
        let eventDate = getEventDate()
        checkedCells.forEach { (type, exist) in
            if exist{
                let event = DevelopmentalEvent(eventType: Int16(type), eventDate: eventDate as NSDate, child: child, staff: staff)
                Model.instance.sendToFB(developmentEvent: event, callback: { (err) in
                    if err != nil{
                        let alert = SimpleAlert(_title: "רק רגע", _message: err!.localizedDescription, dissmissCallback: nil).getAlert()
                        loadingAlert.dismiss(animated: true, completion: {
                            self.present(alert, animated: true, completion: nil)
                            return
                        })
                    }
                    
                })
            }
        }
        loadingAlert.dismiss(animated: true, completion: {
            self.performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
        })
    }

}

// MARK: - TableView data source and delegate
extension DevelopmentalEventViewController: UITableViewDataSource, UITableViewDelegate, DevelopmentalEventTableViewCellDelegate{
    
    func checked(eventType: Int) {
        if checkedCells[eventType] != nil{
            checkedCells[eventType] = !checkedCells[eventType]!
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var num = 0
        switch section {
        case 0:
            num = dataSource.grossMotor.count
            break
        case 1:
            num = dataSource.fineMotor.count
            break
        case 2:
            num = dataSource.social.count
            break
        case 3:
            num = dataSource.language.count
            break
        default: break
        }
        return num
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "developmentalCell") as! DevelopmentalEventTableViewCell
        let section = indexPath.section
        switch section {
        case 0:
            cell.eventTitle = dataSource.grossMotor[indexPath.row]
            break
        case 1:
            cell.eventTitle = dataSource.fineMotor[indexPath.row]
            break
        case 2:
            cell.eventTitle = dataSource.social[indexPath.row]
            break
        case 3:
            cell.eventTitle = dataSource.language[indexPath.row]
            break
        default: break
        }
        cell.eventType = indexPath.row + (section + 1) * 100
        cell.checked = checkedCells[cell.eventType!]!
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        label.font = UIFont(name: "SecularOne-Regular", size: 30)
        label.textColor = Utility.btnTextWhite
        label.text = dataSource.titles[section]
        label.textAlignment = .right
        headerView.addSubview(label)
        headerView.backgroundColor = Utility.btnBackColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
}
