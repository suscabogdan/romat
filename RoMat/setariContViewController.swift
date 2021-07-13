//
//  setariContViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 11/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class setariContViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var nameOfImage = ""
    
    var imageWasPicked = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromDataBase()
    }
    
    @IBOutlet weak var alegePozaDeProfilOutlet: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var pozaDeProfil: UIImageView!
    
    @IBAction func alegePozaDeProfil(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            pozaDeProfil.image = image
            imageWasPicked = true
        }
        else
        {
            print("Error!")
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func salveazaSetarile(_ sender: Any) {
        SVProgressHUD.show()
        if imageWasPicked
        {
            saveImage()
        }
    }
    
    func saveImage()
    {
        // Encoding
        let image = pozaDeProfil.image
        let imageData:NSData = UIImagePNGRepresentation(image!)! as NSData
        
        // Saving to database
        let imagesDB = Database.database().reference().child("Poze de profil")
        let imageDictionary = ["User": Auth.auth().currentUser?.email!, "Image data": imageData] as [String : Any]
        imagesDB.childByAutoId().setValue(imageDictionary) {
            (error, ref) in
            
            if error != nil
            {
                SVProgressHUD.dismiss()
                self.label.text = "Eroare! Incearca din nou!"
            }
            else
            {
                print("Poza salvata!")
            }
        }
    }
    
    func getDataFromDataBase()
    {
        let imagesDB = Database.database().reference().child("Poze de profil")
        imagesDB.observe(.childAdded, with: { (snapshot) in
            let snapshotValue = snapshot.value as! Dictionary<String, NSData> as [String : Any]
            let image = snapshotValue["Image data"]!
            let sender = snapshotValue["User"]!
            self.pozaDeProfil.image = UIImage(data: image as! Data)
            })
    }
    
    func decodeImage()
    {
        
    }
    
}
