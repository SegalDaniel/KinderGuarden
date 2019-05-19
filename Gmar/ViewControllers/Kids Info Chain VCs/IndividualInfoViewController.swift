//
//  IndividualInfoViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 22/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class IndividualInfoViewController: MyViewController {
    
    //MARK: - Variables
    @IBOutlet weak var childImageView: UIImageView!
    @IBOutlet weak var basicCollectionView: UICollectionView!
    @IBOutlet weak var developCollectionView: UICollectionView!
    @IBOutlet weak var logicCollectionView: UICollectionView!
    @IBOutlet weak var titleItem: UINavigationItem!
    @IBOutlet weak var generalNoteLabel: UILabel!
    @IBOutlet weak var startDateBtn: UIButton!
    @IBOutlet weak var endDateBtn: UIButton!
    let developDataSource = DevelopmentalEventsDataSource()
    var startDate:Date?
    var endDate:Date?
    var childID:String?
    var child:Child?
    var basicEvents:[BasicEvent] = []{
        didSet{
            basicCollectionView.reloadData()
        }
    }
    var developmentalEvents:[DevelopmentalEvent] = []{
        didSet{
            developCollectionView.reloadData()
        }
    }
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        startDate = DateAdmin.morningDate(date: Date())
        endDate = Date()
        initChildData()
        initCollections(collections: [basicCollectionView, developCollectionView, logicCollectionView])
        initDatesBtns()
        childImageView.layer.cornerRadius = 10
        generalNoteLabel.layer.cornerRadius = 10
        Utility.addBorder(view: generalNoteLabel)
    }
    
    func initDatesBtns(){
        let start = DateAdmin.extractDateAndTime(date: startDate!, dateStyle: .short, timeStyle: .none)
        let end = DateAdmin.extractDateAndTime(date: endDate!, dateStyle: .short, timeStyle: .none)
        startDateBtn.setTitle("מ \(start)", for: .normal)
        endDateBtn.setTitle("עד \(end)", for: .normal)
    }
    
    func initCollections(collections:[UICollectionView]){
        collections.forEach { (coll) in
            coll.delegate = self
            coll.dataSource = self
            coll.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
            Utility.addBorder(view: coll)
        }
    }
    
    func initChildData(){
        if let id = childID{
            Model.instance.getChild(childID: id) { (child) in
                self.child = child
                self.loadGeneralNote()
                self.titleItem.title = "מידע על \(child.firstName!)"
                let image = Model.instance.loadImageFromDiskWith(fileName: child.childID!)
                if let image = image{
                    self.childImageView.image = image
                }
                else{
                    self.childImageView.image = UIImage(named: "047-baby-2")
                }
            }
            filterEventsByDates()
        }
    }
    
    func loadGeneralNote(){
        var notes:[GeneralNote] = []
        if let child = child{
            child.generalNotes?.forEach({ (obj) in
                notes.append(obj as! GeneralNote)
            })
        }
        notes = notes.filter({ (note) -> Bool in
            let noteDate = note.eventDate! as Date
            if  noteDate >= self.startDate! && noteDate <= self.endDate!{
                return true
            }
            return false
        })
        generalNoteLabel.text = notes.first?.details ?? ""
    }
    
    func filterEventsByDates(){
        Model.instance.getChildsBasicEventsFromCore(childID: self.childID!) { (events) in
            self.basicEvents = events.filter({ (event) -> Bool in
                let eDate = event.eventDate! as Date
                if  eDate >= self.startDate! && eDate <= self.endDate!{
                    return true
                }
                return false
            })
            basicCollectionView.reloadData()
        }
        Model.instance.getChildsDevlopmentEventsFromCore(childID: self.childID!) { (events) in
            self.developmentalEvents = events.filter({ (event) -> Bool in
                let eDate = event.eventDate! as Date
                if  eDate >= self.startDate! && eDate <= self.endDate!{
                    return true
                }
                return false
            })
            developCollectionView.reloadData()
        }
    }
    
    //MARK: - Buttons actions
    @IBAction func showDatePicker(_ sender: UIButton){
        let monthInsSeconds = 2629743.83
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        switch sender {
        case startDateBtn:
            RPicker.selectDate(title: "נא לבחור תאריך התחלה", hideCancel: false, datePickerMode: .date, selectedDate: startDate, minDate: Date(timeIntervalSinceNow: -monthInsSeconds), maxDate: endDate!) { (selectedDate) in
                let date = formatter.string(from: selectedDate)
                self.startDate = DateAdmin.morningDate(date: selectedDate)
                self.startDateBtn.setTitle("מ \(date)", for: .normal)
                self.filterEventsByDates()
                self.loadGeneralNote()
            }
            break
        case endDateBtn:
            RPicker.selectDate(title: "נא לבחור תאריך סיום", hideCancel: false, datePickerMode: .date, selectedDate: endDate, minDate: startDate, maxDate: Date()) { (selectedDate) in
                let date = formatter.string(from: selectedDate)
                self.endDate = DateAdmin.eveningDate(date: selectedDate)
                self.endDateBtn.setTitle("עד \(date)", for: .normal)
                self.filterEventsByDates()
                self.loadGeneralNote()
            }
            break
        default:
           break
        }
    }
    
    @IBAction func todayBtnPressed(_ sender: Any) {
        startDate = DateAdmin.morningDate(date: Date())
        endDate = Date()
        initDatesBtns()
        filterEventsByDates()
        loadGeneralNote()
    }
    
}


//MARK: - Collection View Datasource & Delegate
extension IndividualInfoViewController: UICollectionViewDataSource, UICollectionViewDelegate, BasicEventCollectionViewCellDelegate, DevelopEventCollectionViewCellDelegate{
    func cellTapped(event: DevelopmentalEvent, description: String) {
        let time = DateAdmin.extractDateAndTime(date: event.eventDate! as Date, dateStyle: .short)
        let alert = SimpleAlert(_title: time, _message: description, dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
    
    func cellTapped(event:BasicEvent, description: String) {
        let time = DateAdmin.extractDateAndTime(date: event.eventDate! as Date, dateStyle: .short)
        let alert = SimpleAlert(_title: time, _message: description, dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case basicCollectionView:
            return basicEvents.count
        case developCollectionView:
            return developmentalEvents.count
        case logicCollectionView:
            
            break
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case basicCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath) as! BasicEventCollectionViewCell
            cell.event = basicEvents[indexPath.row]
            cell.delegate = self
            cell.awakeFromNib()
            return cell
        case developCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "developCell", for: indexPath) as! DevelopEventCollectionViewCell
            let eventType = developmentalEvents[indexPath.row].eventType
            let section = eventType / 100
            let row = Int(eventType % 100)
            switch section{
            case 1:
                cell.details = developDataSource.fineMotor[row]
                break
            case 2:
                cell.details = developDataSource.grossMotor[row]
                break
            case 3:
                cell.details = developDataSource.social[row]
                break
            case 4:
                cell.details = developDataSource.language[row]
                break
            default: break
            }
            cell.event = developmentalEvents[indexPath.row]
            cell.delegate = self
            cell.awakeFromNib()
            return cell
        case logicCollectionView:
            
            break
        default:
            break
        }
        return UICollectionViewCell()
    }
}
