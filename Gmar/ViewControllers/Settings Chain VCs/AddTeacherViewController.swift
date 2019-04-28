//
//  AddTeacherViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//
import UIKit
import CropViewController

class AddTeacherViewController: MyViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate, CropViewControllerDelegate {
    
    //MARK: - Variables
    let imagePicker = UIImagePickerController()
    var permissions:Permissions?
    @IBOutlet weak var teacherImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    var teacherImage:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        nameTextField.delegate = self
        lastNameTextField.delegate = self
        permissions = Permissions(target: self, imagePicker: imagePicker)
        Utility.viewTapRecognizer(target: self, toBeTapped: teacherImageView, action: #selector(selectImageTapped))
        Utility.ourTextFieldDesign(textFiled: nameTextField)
        Utility.ourTextFieldDesign(textFiled: lastNameTextField)
        Utility.addShadow(view: teacherImageView)
    }
    
    //MARK: - buttons action
    @IBAction func saveBtnClicked(_ sender: Any) {
        self.view.endEditing(true)
        if teacherImage == nil{
            let alert = UIAlertController(title: "רק רגע לפני שנמשיך", message: "יש באפשרותכם להוסיף תמונה על ידי לחיצה על תמונת הגננת", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "המשך בכל זאת", style: .default, handler: { (action) in
                alert.dismiss(animated: true , completion: nil)
                self.saveStaffToDB()
            }))
            alert.addAction(UIAlertAction(title: "אני רוצה להוסיף", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else {
            saveStaffToDB()
        }
    }
    
    func saveStaffToDB(){
        if nameTextField.text != nil && lastNameTextField.text != nil{
            if nameTextField.text != "" && lastNameTextField.text != ""{
                let loadingView = Utility.getLoadingAlert()
                self.present(loadingView, animated: true, completion: nil)
                let fName = nameTextField.text!
                let lName = lastNameTextField.text!
                let id = "\(fName)\(lName)".hash
                var staff:Staff
                if let teacherImage = teacherImage{
                    Model.instance.saveImageToDisk(imageName: "\(id)", image: teacherImage)
                    staff = Staff(staffID: "\(id)", firstName: fName, lastName: lName, image: "\(id)")
                }
                else{
                    staff = Staff(staffID: "\(id)", firstName: fName, lastName: lName, image: nil)
                }
                Model.instance.sendToFB(staff: staff) { (err) in
                    loadingView.removeFromParent()
                    self.performSegue(withIdentifier: "exit", sender: nil)
                }
                return
            }
        }
        let alert = SimpleAlert(_title: "רק רגע לפני שנמשיך", _message: "נא למלא שם ושם משפחה, ניתן גם להוסיף תמונה", dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - UIIMagePickerDelegate
    @objc func selectImageTapped(){
        imagePicker.modalPresentationStyle = .popover
        imagePicker.popoverPresentationController?.sourceView = saveBtn
        imagePicker.preferredContentSize = CGSize(width: 320, height: 568)
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.permissions?.checkPermissionCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.permissions?.checkPermissionGallery()
        }))
        if let popoverView = alert.popoverPresentationController{
            popoverView.sourceView = saveBtn
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true)
        guard let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) else { return }
        let cropViewController = CropViewController(image: image)
        cropViewController.delegate = self
        cropViewController.aspectRatioPreset = .presetSquare;
        cropViewController.aspectRatioLockEnabled = true
        cropViewController.resetAspectRatioEnabled = false
        cropViewController.aspectRatioPickerButtonHidden = true
        cropViewController.doneButtonTitle = "אישור"
        cropViewController.cancelButtonTitle = "ביטול"
        present(cropViewController, animated: true, completion: nil)
        
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        cropViewController.dismiss(animated: true, completion: nil)
        let newImage = Utility.resizeImage(image: image, targetSize: CGSize(width: 512, height: 512))
        teacherImageView.contentMode = .scaleAspectFit
        teacherImageView.image = newImage
        teacherImageView.backgroundColor = UIColor.clear
        teacherImage = newImage
    }
    
    //MARK: - TextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        Utility.moveWithKeyboard(viewController: self)
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //self.navigationController?.popViewController(animated: false)
    }
    
    
}
