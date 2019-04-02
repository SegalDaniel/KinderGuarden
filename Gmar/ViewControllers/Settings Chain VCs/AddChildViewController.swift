//
//  AddChildViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddChildViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, ChildPickerTableViewCellDelegate {
    
    //MARK: - Variables
    let imagePicker = UIImagePickerController()
    var permissions:Permissions?
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var babyImageView: UIImageView!
    @IBOutlet weak var birthDatePicker: UIDatePicker!
    @IBOutlet weak var prematureSegment: UISegmentedControl!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    @IBOutlet weak var addChildPickerBtn: UIButton!
    @IBOutlet weak var pickingTimePicker: UIDatePicker!
    @IBOutlet weak var childPickerTableView: UITableView!
    @IBOutlet weak var childIDTextField: UITextField!
    var childData:[String:Any] = [:]
    var authAccompData:[String:String] = [:]
    var authAccomps:[AuthorizedAccompanist] = []
    
    var pickers:Int = 0{
        didSet{
            if childPickerTableView != nil{
                childPickerTableView.reloadData()
            }
        }
    }
    
    //MARK: - inits
    override func viewDidLoad() {
        super.viewDidLoad()
        childPickerTableView.delegate = self
        childPickerTableView.dataSource = self
        imagePicker.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        addressTextField.delegate = self
        childIDTextField.delegate = self
        permissions = Permissions(target: self, imagePicker: imagePicker)
        Utility.viewTapRecognizer(target: self, toBeTapped: babyImageView, action: #selector(selectImageTapped))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        cell.delegate = self
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
    
    //MARK: - TextField delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case firstNameTextField:
            childData["firstName"] = firstNameTextField.text!
            break
        case lastNameTextField:
            childData["lastName"] = lastNameTextField.text!
            break
        case addressTextField:
            childData["address"] = addressTextField.text!
            break
        case childIDTextField:
            childData["childID"] = childIDTextField.text!
            break
        default:
            break
        }
    }
    
    //MARK: - ChildPickerTableViewCellDelegate
    func firstName(name: String) {
        authAccompData["name"] = name
        generateAuthAcomp()
    }
    
    func phoneNumber(phone: String) {
        authAccompData["phone"] = phone
        generateAuthAcomp()
    }
    
    func relation(relation: String) {
        authAccompData["relation"] = relation
        generateAuthAcomp()
    }
    
    func generateAuthAcomp(){
        if authAccompData.count == 3{
            if let name = authAccompData["name"]{
                if let phone = authAccompData["phone"]{
                    if let relation = authAccompData["relation"]{
                        authAccomps.append(AuthorizedAccompanist(name: name, phone: phone, relation: relation))
                        authAccompData = [:]
                    }
                    else {return}
                }
                else {return}
            }
            else {return}
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addChildSecondVC"{
            let vc = segue.destination as! AddChildSecondViewController
            if prematureSegment.selectedSegmentIndex == 0{
                childData["isPremature"] = false
            }
            else{
                childData["isPremature"] = true
            }
            if genderSegment.selectedSegmentIndex == 0{
                childData["gender"] = "boy"
            }
            else{
                childData["gender"] = "girl"
            }
            let bDay = birthDatePicker!.date
            let formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = .none
            childData["birthDate"] = formatter.string(from: bDay)
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            let pickup = pickingTimePicker!.date
            childData["pickupHour"] = formatter.string(from: pickup)
            childData["AuthorizedAccompanist"] = authAccomps
            vc.childData = self.childData
        }
    }
    

}
