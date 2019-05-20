//
//  TeacherAddEvent.swift
//  Gmar
//
//  Created by Zach Bachar on 16/02/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class TeacherAddEventViewController: MyViewController {

    //MARK: - Variables
    @IBOutlet weak var topBtnsStack: UIStackView!
    var asAttandance:Bool = false
    var asKidsInfo:Bool = false
    @IBOutlet weak var attandanceBtn: MyButtonLandscapeView!
    @IBOutlet weak var multiChooseBtn: MyButtonLandscapeView!
    @IBOutlet weak var kidsCollectionView: UICollectionView!
    var teacherID:String?
    var kids:[Child]?
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        kidsCollectionView.dataSource = self
        kidsCollectionView.delegate = self
        initViews()
    }
    
    func initViews(){
        if asKidsInfo || asAttandance{
            Model.instance.getAllChildsFromCore { (children) in
                self.kids = children
                self.kidsCollectionView.reloadData()
            }
            topBtnsStack.isHidden = true
            NSLayoutConstraint(item: self.kidsCollectionView!, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .topMargin, multiplier: 1, constant: 20).isActive = true
        }
        else {
            Model.instance.getAllAttendedChildsFromCore { (children) in
                self.kids = children
                self.kidsCollectionView.reloadData()
            }
            topBtnsInit()
        }
        kidsCollectionInit()
    }
    
    func topBtnsInit(){
        attandanceBtn.layer.cornerRadius = 20
        attandanceBtn.setTitle(title: "עדכון נוכחות")
        attandanceBtn.addRadius(radius: 20)
        attandanceBtn.addTag(tag: 0)
        attandanceBtn.setImage(image: UIImage(named: "alarm-clock")!)
        attandanceBtn.addTarget(self, action: #selector(attendanceBtnClicked), for: .touchUpInside)
        attandanceBtn.setBackgroundColor(color:Utility.btnSalmon)
        
        multiChooseBtn.layer.cornerRadius = 20
        multiChooseBtn.setTitle(title: "האכלה מרובה")
        multiChooseBtn.addRadius(radius: 20)
        multiChooseBtn.addTag(tag: 1)
        multiChooseBtn.setImage(image: UIImage(named: "checklist")!)
        multiChooseBtn.addTarget(self, action: #selector(multiChoiseBtnClicked), for: .touchUpInside)
        multiChooseBtn.setBackgroundColor(color:Utility.btnSalmon)
    }
    
    //MARK: - Buttons actions
    @IBAction func attendanceBtnClicked(_ sender: Any){
        print("Attandance btn clicked")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TeacherAddEvent") as! TeacherAddEventViewController
        vc.asAttandance = true
        vc.teacherID = self.teacherID
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func multiChoiseBtnClicked(_ sender: Any) {
        performSegue(withIdentifier: "MultiChoose", sender: nil)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenericInfo"{
            let vc = segue.destination as! GenericVC
            let tup = sender as! (Enums.BasicEvent, Int)
            vc.kind = tup.0
            vc.childID = "\(tup.1)"
            vc.teacherID = self.teacherID
        }
        else if segue.identifier == "MultiChoose"{
            let vc = segue.destination as! MultiChoiseViewController
            vc.staffID = self.teacherID
        }
        else if segue.identifier == "EventKind"{
            let vc = segue.destination as! EventKindViewController
            let id = sender as! Int
            Model.instance.eventChildAndStaff(childID: "\(id)", staffID: teacherID!)
            vc.childID = "\(id)"
            vc.teacherID = self.teacherID
        }
        else if segue.identifier == "kidInfo"{
            let vc = segue.destination as! IndividualInfoViewController
            let id = sender as! Int
            vc.childID = "\(id)"
        }
    }
    
    //MARK: - Unwind seague
    @IBAction func unwindToSelectKid(segue:UIStoryboardSegue) {
        initViews()
    }
}


extension TeacherAddEventViewController: UICollectionViewDataSource, UICollectionViewDelegate, KidCollectionViewCellDelegate{
    
    //change the child id to string here and in prepare for...
    func kidCellTapped(child: Child) {
        if asAttandance{
            performSegue(withIdentifier: "GenericInfo", sender: (Enums.BasicEvent.attandance, Int(child.childID!)!))
        }
        else if asKidsInfo{
            performSegue(withIdentifier: "kidInfo", sender: Int(child.childID!)!)
        }
        else{
            performSegue(withIdentifier: "EventKind", sender: Int(child.childID!)!)
        }
    }
    
    func kidCellDragExit(child:Child){
        let alert = UIAlertController(title: "האם ברצונך למחוק ילד זה?", message: "פעולה זו תהיה בלתי הפיכה", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "אישור", style: .default, handler: { (action) in
            Model.instance.deleteChildFromDB(childID: child.childID!, callback: { (error) in
                if error == nil{
                    alert.dismiss(animated: true, completion: nil)
                    self.present(SimpleAlert(_title: "נמחק בהצלחה", _message: "", dissmissCallback: nil).getAlert(), animated: true, completion: {
                        self.performSegue(withIdentifier: "unwindToMainWindow", sender: nil)
                    })
                }
                else{
                    alert.dismiss(animated: true, completion: nil)
                    self.present(SimpleAlert(_title: "לא נמחק, נסה שנית", _message: "", dissmissCallback: nil).getAlert(), animated: true, completion: nil)
                }
            })
        }))
        alert.addAction(UIAlertAction(title: "ביטול", style: .cancel, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if kids != nil{
            return kids!.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kidCell", for: indexPath) as! KidCollectionViewCell
        cell.delegate = self
        cell.child = kids![indexPath.row]
        cell.awakeFromNib()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kidCell", for: indexPath)
        Utility.addBorder(view: cell)
    }
    
    func kidsCollectionInit(){
        let size = kidsCollectionView.frame.width / 3.5
        let spLayout = kidsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        spLayout.itemSize = CGSize(width: size, height: size)
        kidsCollectionView.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
        kidsCollectionView.allowsSelection = false
    }
}
