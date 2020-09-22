//
//  TripAddAction.swift
//  Plannery-app
//
//  Created by Dewa Prabawa on 14/09/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit
import Photos
import JGProgressHUD

class TripAddAction: UIViewController {
    
    @IBOutlet weak var actionCard:UIView!
    @IBOutlet weak var tripAddLabel:UILabel!
    @IBOutlet weak var addTextField:UITextField!
    @IBOutlet weak var cancelButton:UIButton!
    @IBOutlet weak var saveButton:UIButton!
    @IBOutlet weak var imageLeftField: UIImageView!
    
    private var spinner = JGProgressHUD(style: .dark)
    
    var doneSaving: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addTextField.becomeFirstResponder()
    }
    
    private func setupViews(){
        tripAddLabel.textColor = Theme.tint
        tripAddLabel.font = UIFont(name: Theme.boldFontTheme, size: 28)
        actionCard.createRoundedWithLitleRadius()
        
        saveButton.createRoundedButtonWithLitleRadius()
        cancelButton.createRoundedButtonWithLitleRadius()
        imageLeftField.createRoundedWithLitleRadius()
     }
    
    private func presentPhotoInputController(){
        spinner.show(in:view)
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        spinner.dismiss()
    }
    
    private func alertController(with title: String, message address: String, action label: String, completion:@escaping(UIAlertAction) -> ()){
        let ac = UIAlertController(title: title, message: address, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: label, style: .default, handler: completion))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func addImageToCell(_ sender: Any){
    
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            PHPhotoLibrary.requestAuthorization { [weak self] request in
                
                guard let strongSelf = self else {
                     return
                }
                
                switch request {
                case .authorized:
                    DispatchQueue.main.async {
                        strongSelf.presentPhotoInputController()
                    }
                case .notDetermined:
                    if request == PHAuthorizationStatus.authorized {
                        strongSelf.presentPhotoInputController()
                    }
                case .restricted:
                    strongSelf.alertController(with: "Photo Library Restricted", message: "Photo library access is restricted and cannot be accessed", action: "OK") { (_) in
                        return
                    }
                case .denied:
                    strongSelf.alertController(with: "Photo library is denied", message: "Photo library access was previously denied, Please update the setting if you wish to change this", action: "Go to settings") { (_) in
                        DispatchQueue.main.async {
                            if let url = URL(string: UIApplication.openSettingsURLString){
                                UIApplication.shared.open(url, options: [:])
                            }
                        }
                    }
                default: break
                }
            }
        }
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        
        self.showRightIcon(isShow: false)
        
        guard let addTextField = addTextField.text, !addTextField.isEmpty else {
            self.showRightIcon(isShow: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.showRightIcon(isShow: false)
            }
            return
        }
        
        let model = TripModel(title: addTextField, image: self.imageLeftField.image)
        
        TripFunction.shared.createTrip(trip:model)
        
        doneSaving?()
        
        dismiss(animated: true)
    }
    
    private func showRightIcon(isShow: Bool){
        let imaveRightView = UIImageView(image: UIImage(systemName: "exclamationmark.triangle.fill"))
        imaveRightView.tintColor = .red
        imaveRightView.frame = CGRect(x: 10, y: 0, width: 30, height: 30)
        imaveRightView.contentMode = .scaleToFill
        addTextField.rightView = imaveRightView
        addTransition(add: addTextField, with: 1, isShow: isShow)
    }
    
    
    private func addTransition(add view: UITextField, with duration: Double, isShow: Bool){
        UIView.transition(with: view, duration: duration, options: .transitionCrossDissolve, animations: {
            view.rightViewMode = isShow ? .always : .never
        }, completion: nil)
    }
}


extension TripAddAction: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:
        [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.imageLeftField.image = selectedImage
        }
        
        
        
        picker.dismiss(animated: true, completion: nil)
    }
}


