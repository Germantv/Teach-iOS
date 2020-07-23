//
//  CameraViewController.swift
//  Pokedex
//
//  Created by German Flores on 7/23/20.
//  Copyright © 2020 German Flores. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var coverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createImagePicker()
        
        coverView.layer.cornerRadius = coverView.frame.height / 2
        selectedImage.layer.cornerRadius = 8
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        createImagePicker()
    }
    
    // MARK: Helpers
    func createImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("Camera is available 📸")
            imagePicker.sourceType = .camera
        } else {
            print("Camera 🚫 available so we will use photo library instead")
            imagePicker.sourceType = .photoLibrary
        }
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    // MARK: ImagePicker Delegate Methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pickedImage = info[.originalImage] as! UIImage
        
        self.selectedImage.image = pickedImage
        
        print("Image dismissed")
        dismiss(animated: true, completion: nil)
    }
//    func imagePickerController(_ picker: UIImagePickerController,
//                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let originalImage = info[.originalImage] as! UIImage
//        //let editedImage = info[.editedImage] as! UIImage
//
//
//        self.selectedImageView.image = originalImage
//
//        print("image dismissed")
//        dismiss(animated: true, completion: nil)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
