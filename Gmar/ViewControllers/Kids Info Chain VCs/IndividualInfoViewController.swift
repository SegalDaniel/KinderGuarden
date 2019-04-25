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
        initChildData()
        initCollections(collections: [basicCollectionView, developCollectionView, logicCollectionView])
    }
    
    func initCollections(collections:[UICollectionView]){
        collections.forEach { (coll) in
            coll.delegate = self
            coll.dataSource = self
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
            Model.instance.getAllBasicEventsFromCore { (events) in
                self.basicEvents = events
                basicCollectionView.reloadData()
            }
        }
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
