//
//  IndividualInfoViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 22/04/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class IndividualInfoViewController: MyViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - Variables
    @IBOutlet weak var childImageView: UIImageView!
    @IBOutlet weak var basicCollectionView: UICollectionView!
    @IBOutlet weak var developCollectionView: UICollectionView!
    @IBOutlet weak var logicCollectionView: UICollectionView!
    @IBOutlet weak var titleItem: UINavigationItem!
    @IBOutlet weak var generalNoteLabel: UILabel!
    @IBOutlet weak var startDateBtn: UIButton!
    @IBOutlet weak var endDateBtn: UIButton!
    var startDate:Date?
    var endDate:Date?
    var childID:String?
    var child:Child?
    var basicEvents:[BasicEvent] = []{
        didSet{
            basicCollectionView.reloadData()
        }
    }
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        morningDate(date: Date())
        endDate = Date()
        initChildData()
        initCollections(collections: [basicCollectionView, developCollectionView, logicCollectionView])
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
                self.child = child
                self.titleItem.title = "מידע על \(child.firstName!)"
                let image = Model.instance.loadImageFromDiskWith(fileName: child.childID!)
                if let image = image{
                    self.childImageView.image = image
                }
                else{
                    self.childImageView.image = UIImage(named: "047-baby-2")
                }
            }
            filterByDates()
        }
    }
    
    func filterByDates(){
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
                self.morningDate(date: selectedDate)
                self.startDateBtn.setTitle("מ \(date)", for: .normal)
                self.filterByDates()
            }
            break
        case endDateBtn:
            RPicker.selectDate(title: "נא לבחור תאריך סיום", hideCancel: false, datePickerMode: .date, selectedDate: endDate, minDate: startDate, maxDate: Date()) { (selectedDate) in
                let date = formatter.string(from: selectedDate)
                self.eveningDate(date: selectedDate)
                self.endDateBtn.setTitle("עד \(date)", for: .normal)
                self.filterByDates()
            }
            break
        default:
           break
        }
    }
    
    func morningDate(date:Date){
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        let today = formatter.string(from: date)
        formatter.dateFormat = "dd/MM/yy , HH:mm"
        formatter.timeZone = TimeZone.current
        let toFormat = "\(today) , 06:00"
        let todayMorning = formatter.date(from: toFormat)
        startDate = todayMorning
    }
    
    func eveningDate(date:Date){
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        let today = formatter.string(from: date)
        formatter.dateFormat = "dd/MM/yy , HH:mm"
        formatter.timeZone = TimeZone.current
        let toFormat = "\(today) , 23:00"
        let todayEve = formatter.date(from: toFormat)
        endDate = todayEve
    }
    
    //MARK: - Collection View Datasource & Delegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case basicCollectionView:
            return basicEvents.count
        case developCollectionView:
            
            break
            
        case logicCollectionView:
            
            break
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "basicCell", for: indexPath)
        switch collectionView {
        case basicCollectionView:
            let cell = cell as! BasicEventCollectionViewCell
            cell.event = basicEvents[indexPath.row]
            cell.awakeFromNib()
            break
        case developCollectionView:
            
            break
        case logicCollectionView:
            
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
