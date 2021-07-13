//
//  creareContViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 02/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import IQKeyboardManager

var verificareInregistrare:Bool = false

var email:String = ""
var numePrenume:String = ""
var userName:String = ""
var parola:String = ""
var reParola:String = ""

class creareContViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var nameOfImage = ""
    
    var imageWasPicked = false
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var numeSiPrenume: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var parolaTextField: UITextField!
    @IBOutlet weak var reintroduParolaTextField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func pozaDeProfilButton(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        self.present(image, animated: true)
    }
    
    @IBOutlet weak var pozaDeProfil: UIImageView!
    
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
    
    @IBAction func creareCont(_ sender: Any) {
        if emailTextField.text == "" || parolaTextField.text == "" || reintroduParolaTextField.text == "" && numeSiPrenume.text != "" && username.text != ""
        {
            label.text = "Toate campurile sunt obligatorii!"
        }
        else
        {
            SVProgressHUD.show()
            email = emailTextField.text!
            parola = parolaTextField.text!
            reParola = reintroduParolaTextField.text!
            numePrenume = numeSiPrenume.text!
            userName = username.text!
            if parola != reParola
            {
                label.text = "Ai reintrodus gresit parola!"
            }
            else
            {
                Auth.auth().createUser(withEmail: email, password: parola) { (user, error) in
                    if error != nil
                    {
                        print(error!)
                        SVProgressHUD.dismiss()
                        self.label.text = "Eroare! Incearca din nou!"
                    }
                    else
                    {
                        guard let uid = Auth.auth().currentUser?.uid else {
                            return
                        }
                        let ref = Database.database().reference(fromURL: "https://romat-database.firebaseio.com/")
                        let usersReference = ref.child("Users").child(uid)
                        let values = ["Email": email, "Nume": numePrenume, "Username": userName, "Clasa": ""]
                        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref ) in
                            if err != nil
                            {
                                print(err!)
                                SVProgressHUD.dismiss()
                                self.label.text = "Eroare! Incearca din nou!"
                            }
                            else
                            {
                                print("Succes!")
                                SVProgressHUD.dismiss()
                                self.inregistrareTrue()
                                let intrarePrincipala = self.storyboard?.instantiateViewController(withIdentifier: "navigation")
                                self.present(intrarePrincipala!, animated: true, completion: nil)
                            }
                        })
                    }
                }
            }
        }
    }
    
    func inregistrareTrue()
    {
        let verificare = UserDefaults.standard
        verificare.setValue(1, forKey: "verificareLogare")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let ref = Database.database().reference(fromURL: "https://romat-database.firebaseio.com/")
//
//        ref.updateChildValues(["somevalue": 1234])
        
    }
    
}
