//
//  inregistrareViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 02/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import IQKeyboardManager

class inregistrareViewController: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var parolaTF: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func inregistrare(_ sender: Any) {
        if emailTF.text == "" || parolaTF.text == ""
        {
            label.text = "Nu ai completat toate campurile!"
        }
        else
        {
            SVProgressHUD.show()
            email = emailTF.text!
            parola = parolaTF.text!
            Auth.auth().signIn(withEmail: email, password: parola) { (user, error) in
                if error != nil
                {
                     print("Eroare!")
                     SVProgressHUD.dismiss()
                     self.label.text = "Eroare! Incearca din nou!"
                }
                else
                {
                    SVProgressHUD.dismiss()
                    self.inregistrareTrue()
                    let intrarePrincipala = self.storyboard?.instantiateViewController(withIdentifier: "navigation")
                    self.present(intrarePrincipala!, animated: true, completion: nil)
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
        
        let ref = Database.database().reference(fromURL: "https://romat-database.firebaseio.com/")
        
        ref.updateChildValues(["somevalue": 1234])
        
    }
    
}
