//
//  AddTeacherViewController.swift
//  Gmar
//
//  Created by Zach Bachar on 23/03/2019.
//  Copyright © 2019 Final Project. All rights reserved.
//

import UIKit

class AddTeacherViewController: MyViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

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
        let alert = SimpleAlert(_title: "אופס", _message: "נא למלא שם ושם משפחה, ניתן גם להוסיף תמונה", dissmissCallback: nil).getAlert()
        self.present(alert, animated: true, completion: nil)
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
        let cropped = cropToBounds(image: image, width: 100, height: 100)
        teacherImageView.image = cropped
        teacherImageView.backgroundColor = UIColor.clear
        teacherImage = cropped
    }
    
    func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
        let cgimage = image.cgImage!
        let contextImage: UIImage = UIImage(cgImage: cgimage)
        let contextSize: CGSize = contextImage.size
        var posX: CGFloat = 0.0
        var posY: CGFloat = 0.0
        var cgwidth: CGFloat = CGFloat(width)
        var cgheight: CGFloat = CGFloat(height)
        
        // See what size is longer and create the center off of that
        if contextSize.width > contextSize.height {
            posX = ((contextSize.width - contextSize.height) / 2)
            posY = 0
            cgwidth = contextSize.height
            cgheight = contextSize.height
        } else {
            posX = 0
            posY = ((contextSize.height - contextSize.width) / 2)
            cgwidth = contextSize.width
            cgheight = contextSize.width
        }
        
        let rect: CGRect = CGRect(x: posX, y: posY, width: cgwidth, height: cgheight)
        
        // Create bitmap image from context using the rect
        let imageRef: CGImage = cgimage.cropping(to: rect)!
        
        // Create a new image based on the imageRef and rotate back to the original orientation
        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        
        return image
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
