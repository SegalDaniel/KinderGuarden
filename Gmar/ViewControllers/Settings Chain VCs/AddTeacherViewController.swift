//
//  AddTeacherViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddTeacherViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
        permissions = Permissions(target: self, imagePicker: imagePicker)
        Utility.viewTapRecognizer(target: self, toBeTapped: teacherImageView, action: #selector(selectImageTapped))
    }
    
    //MARK: - buttons action
    @IBAction func saveBtnClicked(_ sender: Any) {
        if nameTextField.text != nil && lastNameTextField.text != nil{
            if nameTextField.text != "" && lastNameTextField.text != ""{
                let fName = nameTextField.text!
                let lName = lastNameTextField.text!
                let id = "\(fName)\(lName)".hash
                if let teacherImage = teacherImage{
                    Model.instance.saveImageToDisk(imageName: "\(id)", image: teacherImage)
                    let _ = Staff(staffID: "\(id)", firstName: fName, lastName: lName, image: "\(id)")
                }
                else{
                    let _ = Staff(staffID: "\(id)", firstName: fName, lastName: lName, image: nil)
                }
                Model.instance.saveToDB(callback: nil)
            }
        }
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
            popoverView.sourceView = saveBtn
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        teacherImageView.contentMode = .scaleAspectFit
        teacherImageView.image = image
        teacherImageView.backgroundColor = UIColor.clear
        teacherImage = image
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
