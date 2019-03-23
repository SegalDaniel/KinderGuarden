//
//  AddChildViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddChildViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK: - Variables
    let imagePicker = UIImagePickerController()
    var permissions:Permissions?
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var babyImageView: UIImageView!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var addChildPickerBtn: UIButton!
    @IBOutlet weak var pickingTimePicker: UIDatePicker!
    @IBOutlet weak var childPickerTableView: UITableView!
    @IBOutlet weak var childIDTextField: UITextField!
    
    var pickers:Int = 0{
        didSet{
            if childPickerTableView != nil{
                childPickerTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        childPickerTableView.delegate = self
        childPickerTableView.dataSource = self
        imagePicker.delegate = self
        permissions = Permissions(target: self, imagePicker: imagePicker)
        Utility.viewTapRecognizer(target: self, toBeTapped: babyImageView, action: #selector(selectImageTapped))
    }
    

    //MARK: - Button action
    @IBAction func addPickerBtnClicked(_ sender: Any) {
        pickers += 1
    }
    
    
    //MARK: - child picker table view delegate & datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "childPicker", for: indexPath) as! ChildPickerTableViewCell
        
        return cell
    }
    
    
    //MARK: - UIIMagePickerDelegate
    @objc func selectImageTapped(){
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.permissions?.checkPermissionCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.permissions?.checkPermissionGallery()
        }))
        if let popoverView = alert.popoverPresentationController{
            popoverView.sourceView = childIDTextField
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        babyImageView.contentMode = .scaleAspectFit
        babyImageView.image = image
        babyImageView.backgroundColor = UIColor.clear
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
