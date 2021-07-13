//
//  cautareUseriViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 22/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class cautareUseriViewController: UIViewController, UISearchBarDelegate {
    
    var searchedUser = ""
    
    var numeClasa = ""
    
    @IBOutlet weak var pozaDeProfil: UIImageView!
    @IBOutlet weak var usernameTF: UILabel!
    @IBOutlet weak var numeLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var adaugaClasaOutlet: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adaugaClasaOutlet.backgroundColor = .white
        adaugaClasaOutlet.isEnabled = false
        numeLabel.text = ""
        usernameLabel.text = ""
        pozaDeProfil.image = nil
    }
    
    @IBAction func adaugaInClasa(_ sender: Any) {
        
    }
    
    @IBAction func search(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        searchedUser = searchBar.text!
        
        SVProgressHUD.show()
        getUser()
    }
    
    func getUser()
    {
        let databaseRef = Database.database().reference()
        databaseRef.child("Users").queryOrdered(byChild: searchedUser).observe(.value) { (snapshot) in
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapShot
                {
                    if let mainDict = snap.value as? [String : AnyObject] {
                        let numeDB = mainDict["Nume"] as? String
                        let usernameDB = mainDict["Username"] as? String
                        self.numeLabel.text = numeDB!
                        self.usernameLabel.text = usernameDB!
                        self.adaugaClasaOutlet.backgroundColor = .black
                        self.adaugaClasaOutlet.isEnabled = true
                        UIApplication.shared.endIgnoringInteractionEvents()
                        SVProgressHUD.dismiss()
                    }
                }
            }
        }
    }
    
    func creareClasa()
    {
        let databaseRef = Database.database().reference()
        databaseRef.child("Users").queryOrdered(byChild: searchedUser).observe(.value) { (snapshot) in
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapShot
                {
                    if let mainDict = snap.value as? [String : AnyObject] {
                        self.numeClasa = (mainDict["Clasa"] as? String)!
                        if self.numeClasa == ""
                        {
                            self.createAlertTF(title: "Creaza o clasa", message: "Scrie numele clasei!")
                            UIApplication.shared.endIgnoringInteractionEvents()
                            SVProgressHUD.dismiss()
                        }
                        else
                        {
                            self.updateClasa()
                        }
                    }
                }
            }
        }
    }
    
    func updateClasa()
    {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let ref = Database.database().reference(fromURL: "https://romat-database.firebaseio.com/")
        let usersReference = ref.child("Users").child(uid)
        let values = ["Clasa": numeClasa]
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
            }
        })
    }
    
    func creareClasa2()
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
            }
        })
    }
    
    func createAlertTF(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.text = ""
        }
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0]
            self.numeClasa = textField!.text!
            self.updateClasa()
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
