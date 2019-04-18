//
//  AddChildViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 20/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddChildViewController: MyViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, ChildPickerTableViewCellDelegate {
    
    //MARK: - Variables
    let imagePicker = UIImagePickerController()
    var permissions:Permissions?
    var delegate:AddChildViewControllerDelegate?
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
    @IBOutlet weak var nextBarButton: UIBarButtonItem!
    var childData:[String:Any] = [:]
    var authAccomps:[AuthorizedAccompanist] = []
    var pickers:Int = 0
    
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
    
    //MARK: - Button action
    @IBAction func addPickerBtnClicked(_ sender: Any) {
        pickers += 1
        delegate?.shouldEndEditing()
        childPickerTableView.beginUpdates()
        childPickerTableView.insertRows(at: [IndexPath(row: pickers - 1, section: 0)], with: .automatic)
        childPickerTableView.endUpdates()
        self.view.endEditing(true)
    }
    
    @IBAction func nextScreenBtnClicked(_ sender: Any) {
        if childData["firstName"] == nil || childData["firstName"] as! String == ""{
            performAlert(with: "נא למלא שם פרטי בבקשה")
            return
        }
        if childData["lastName"] == nil || childData["lastName"] as! String == ""{
            performAlert(with: "נא למלא שם משפחה בבקשה")
            return
        }
        if childData["address"] == nil || childData["address"] as! String == ""{
            performAlert(with: "נא למלא כתובת בבקשה")
            return
        }
        if childData["childID"] == nil || childData["childID"] as! String == ""{
            performAlert(with: "נא למלא תעודת זהות של הילד בבקשה")
            return
        }
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
        self.view.endEditing(true)
        if pickers != authAccomps.count{
            delegate?.shouldEndEditing()
        }
        if authAccomps.count == 0{
            performAlert(with: "נא להוסיף מלווים מורשים לילד בבקשה")
            return
        }
        childData["AuthorizedAccompanist"] = authAccomps
        childData["birthDate"] = birthDatePicker!.date
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        let pickup = pickingTimePicker!.date
        childData["pickupHour"] = formatter.string(from: pickup)
        
        if childData["image"] == nil{
            let alert = UIAlertController(title: "רק רגע לפני שנמשיך", message: "יש באפשרותכם להוסיף תמונה של הילד על ידי לחיצה על תמונת התינוק", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "המשך בכל זאת", style: .default, handler: { (action) in
                self.performSegue(withIdentifier: "addChildSecondVC", sender: nil)
            }))
            alert.addAction(UIAlertAction(title: "אני רוצה להוסיף", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            self.performSegue(withIdentifier: "addChildSecondVC", sender: nil)
        }
    }
    
    func performAlert(with text:String){
        let alert = SimpleAlert(_title: "רק רגע", _message: text, dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
    
    
    //MARK: - child picker table view delegate & datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pickers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "childPicker", for: indexPath) as! ChildPickerTableViewCell
        cell.delegate = self
        cell.vc = self
        cell.removeAll()
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        return [UITableViewRowAction(style: .destructive, title: "מחק", handler: { (action, index) in
            self.delegate?.shouldEndEditing()
            if self.authAccomps.count > 0 && self.pickers > 0{
                if indexPath.row < self.authAccomps.count{
                    self.authAccomps.remove(at: indexPath.row)
                }
            }
            self.pickers -= 1
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        })]
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
        childData["image"] = image
    }
    
    //MARK: - TextField delegate
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.view.endEditing(true)
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
    func authData(data: [String : String]){
        if data.count == 3{
            if let name = data["name"]{
                if let phone = data["phone"]{
                    if let relation = data["relation"]{
                        if name != "" && phone != ""{
                            authAccomps.append(AuthorizedAccompanist(name: name, phone: phone, relation: relation))
                        }
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
            vc.childData = self.childData
        }
    }
    

}

protocol AddChildViewControllerDelegate {
    func shouldEndEditing()
}
