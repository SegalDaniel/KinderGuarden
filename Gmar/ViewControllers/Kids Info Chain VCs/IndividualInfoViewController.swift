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
    @IBOutlet weak var familyCollectionView: UICollectionView!
    @IBOutlet weak var notesCollectionView: UICollectionView!
    @IBOutlet weak var titleItem: UINavigationItem!
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
    var familyReports:[FamilyReport] = []{
        didSet{
            familyCollectionView.reloadData()
        }
    }
    var generalNotes:[GeneralNote] = []{
        didSet{
            notesCollectionView.reloadData()
        }
    }
    var childAlerts:[Alert] = []{
        didSet{
            logicCollectionView.reloadData()
        }
    }
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        startDate = DateAdmin.morningDate(date: Date())
        endDate = Date()
        initChildData()
        initCollections(collections: [basicCollectionView, developCollectionView, logicCollectionView, familyCollectionView, notesCollectionView])
        initDatesBtns()
        childImageView.layer.cornerRadius = 10
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
                if let child = child{
                    self.child = child
                    self.loadGeneralNote()
                    self.loadFamilyReports()
                    self.loadAlerts()
                    self.titleItem.title = "מידע על \(child.firstName!)"
                    let image = Model.instance.loadImageFromDiskWith(fileName: child.childID!)
                    if let image = image{
                        self.childImageView.image = image
                    }
                    else{
                        self.childImageView.image = UIImage(named: "047-baby-2")
                    }
                }
            }
            filterEventsByDates()
        }
    }
    
    //MARK: - Init data of child
    func loadFamilyReports(){
        familyReports = []
        if let child = child{
            child.familyReports?.forEach({ (obj) in
                self.familyReports.append(obj as! FamilyReport)
            })
            self.familyReports = self.familyReports.filter({ (report) -> Bool in
                let reportDate = report.eventDate! as Date
                if  reportDate >= self.startDate! && reportDate <= self.endDate!{
                    return true
                }
                return false
            })
        }
    }
    
    func loadGeneralNote(){
        generalNotes = []
        if let child = child{
            child.generalNotes?.forEach({ (obj) in
                self.generalNotes.append(obj as! GeneralNote)
            })
        }
        self.generalNotes = self.generalNotes.filter({ (note) -> Bool in
            let noteDate = note.eventDate! as Date
            if  noteDate >= self.startDate! && noteDate <= self.endDate!{
                return true
            }
            return false
        })
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
    
    func loadAlerts(){
        Model.instance.getAlertsByChildID(childID: self.childID!) { (events) in
            self.childAlerts = events.filter({ (event) -> Bool in
                let eDate = event.alertDate! as Date
                if  eDate >= self.startDate! && eDate <= self.endDate!{
                    return true
                }
                return false
            })
            self.logicCollectionView.reloadData()
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
                self.loadFamilyReports()
                self.loadAlerts()
            }
            break
        case endDateBtn:
            RPicker.selectDate(title: "נא לבחור תאריך סיום", hideCancel: false, datePickerMode: .date, selectedDate: endDate, minDate: self.startDate!, maxDate: Date()) { (selectedDate) in
                let date = formatter.string(from: selectedDate)
                self.endDate = DateAdmin.eveningDate(date: selectedDate)
                self.endDateBtn.setTitle("עד \(date)", for: .normal)
                self.filterEventsByDates()
                self.loadGeneralNote()
                self.loadFamilyReports()
                self.loadAlerts()
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
        loadFamilyReports()
        loadAlerts()
    }
    
}


//MARK: - Collection View Datasource & Delegate
extension IndividualInfoViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case basicCollectionView:
            return basicEvents.count
        case developCollectionView:
            return developmentalEvents.count
        case logicCollectionView:
            return childAlerts.count
        case familyCollectionView:
            return familyReports.count
        case notesCollectionView:
            return generalNotes.count
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "logicCell", for: indexPath) as! AlertCollectionViewCell
            cell.alert = childAlerts[indexPath.row]
            cell.delegate = self
            cell.awakeFromNib()
            return cell
        case familyCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "familyCell", for: indexPath) as! FamilyReportCollectionViewCell
            cell.report = familyReports[indexPath.row]
            cell.delegate = self
            cell.awakeFromNib()
            return cell
        case notesCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "notesCell", for: indexPath) as! GeneralNoteCollectionViewCell
            cell.note = generalNotes[indexPath.row]
            cell.delegate = self
            cell.awakeFromNib()
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
}

//MARK: CollectionViewCells Delegate
extension IndividualInfoViewController: BasicEventCollectionViewCellDelegate, DevelopEventCollectionViewCellDelegate, FamilyReportCollectionViewCellDelegate, GeneralNoteCollectionViewCellDelegate, AlertCollectionViewCellDelegate{
    func cellDragExit(event: BasicEvent) {
        showDeleteALertView {
            Model.instance.deleteBasicEvent(event: event, callback: { (err) in
                if err != nil{
                    let alert = SimpleAlert(_title: "שגיאה", _message: err!.localizedDescription, dissmissCallback: nil).getAlert()
                    self.present(alert, animated: true, completion: nil)
                }
                self.initChildData()
            })
            
        }
    }
    
    func cellDragExit(event: DevelopmentalEvent) {
        showDeleteALertView {
            Model.instance.managedContext.delete(event)
            Model.instance.saveToDB(callback: nil)
            self.initChildData()
        }
    }
    
    func cellDragExit(report: FamilyReport) {
        showDeleteALertView {
            Model.instance.managedContext.delete(report)
            Model.instance.saveToDB(callback: nil)
            self.initChildData()
        }
    }
    
    func cellDragExit(note: GeneralNote) {
        showDeleteALertView {
            Model.instance.managedContext.delete(note)
            Model.instance.saveToDB(callback: nil)
            self.initChildData()
        }
    }
    
    func cellDragExit(alert: Alert) {
        showDeleteALertView {
            Model.instance.managedContext.delete(alert)
            Model.instance.saveToDB(callback: nil)
            self.initChildData()
        }
    }
    
    func cellTapped(alert: Alert, description: String) {
        let time = DateAdmin.extractDateAndTime(date: alert.alertDate! as Date, dateStyle: .short)
        
        let alert = SimpleAlert(_title: time, _message: "\(description)\n\(alert.actionNeeded!)", dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
    
    func cellTapped(note: GeneralNote, description: String) {
        let time = DateAdmin.extractDateAndTime(date: note.eventDate! as Date, dateStyle: .short)
        let alert = SimpleAlert(_title: time, _message: description, dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
    
    func cellTapped(report: FamilyReport, description: String) {
        let time = DateAdmin.extractDateAndTime(date: report.eventDate! as Date, dateStyle: .short)
        let alert = SimpleAlert(_title: time, _message: description, dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
    
    func cellTapped(event: DevelopmentalEvent, description: String) {
        let time = DateAdmin.extractDateAndTime(date: event.eventDate! as Date, dateStyle: .short)
        let alert = SimpleAlert(_title: time, _message: description, dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
    
    func cellTapped(event:BasicEvent, description: String) {
        print("\(event.eventID ?? "no ID") level:\(event.level)")
        if let date = event.eventDate{
            let time = DateAdmin.extractDateAndTime(date: date as Date, dateStyle: .short)
            let alert = SimpleAlert(_title: time, _message: description, dissmissCallback: nil).getAlert()
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showDeleteALertView(callback:@escaping ()->Void){
        let alert = UIAlertController(title: "רק רגע", message: "האם אתה בטוח שברצונך למחוק אירוע זה?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "מחק", style: .destructive, handler: { (action) in
            callback()
        }))
        alert.addAction(UIAlertAction(title: "ביטול", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
