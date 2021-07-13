//
//  profilViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 02/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import UIKit
import Firebase

class profilViewController: UIViewController {
    
    var menuShowing = false
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var pozaDeProfil: UIImageView!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var menuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuOutlet: UIButton!
    
    @IBAction func showMenu(_ sender: Any) {
        showSideMenu()
    }
    
    @IBAction func exitMenu(_ sender: Any) {
        showSideMenu()
    }
    
    @IBAction func romanaMenu(_ sender: Any) {
        let mate = storyboard?.instantiateViewController(withIdentifier: "navigation")
        present(mate!, animated: true, completion: nil)
    }
    
    @IBAction func mateMenu(_ sender: Any) {
        let mate = storyboard?.instantiateViewController(withIdentifier: "navigationMate")
        present(mate!, animated: true, completion: nil)
    }
    
    @IBAction func profilMenu(_ sender: Any) {
        showSideMenu()
    }
    
    @IBAction func contactMenu(_ sender: Any) {
        let mate = storyboard?.instantiateViewController(withIdentifier: "navigationContact")
        present(mate!, animated: true, completion: nil)
    }
    
    func showSideMenu()
    {
        if menuShowing
        {
            UIView.animate(withDuration: 0.2 , delay: 0.1, options: .curveEaseOut, animations: {
                self.menuConstraint.constant -= 250
                self.exitMenuConstraint.constant -= 320
                self.exitMenuConstraint2.constant += 320
                self.exitMenuOutlet.backgroundColor = .clear
                
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        else
        {
            UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseOut, animations: {
                self.menuConstraint.constant = 0
                self.exitMenuConstraint.constant = 0
                self.exitMenuConstraint2.constant = 0
                self.exitMenuOutlet.backgroundColor = UIColor(white: 1, alpha: 0.5)
                
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        menuShowing = !menuShowing
    }
    
    @IBAction func iesire(_ sender: Any) {
        do
        {
            try Auth.auth().signOut()
            inregistrareFalse()
            createAlert(title: "Iesire!", message: "Vrei sa iesi din cont?")
        }
        catch
        {
            print("Eroare la iesire!")
        }
    }
    
    func inregistrareFalse()
    {
        let verificare = UserDefaults.standard
        verificare.setValue(0, forKey: "verificareLogare")
    }
    
    func inregistrareTrue()
    {
        let verificare = UserDefaults.standard
        verificare.setValue(1, forKey: "verificareLogare")
    }
    
    func createAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Da", style: UIAlertActionStyle.default, handler:{ (action) in
            let login = self.storyboard?.instantiateViewController(withIdentifier: "inregistrare")
            self.present(login!, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Nu", style: UIAlertActionStyle.default, handler:{ (action) in
        }))
        self.present(alert, animated: true, completion: nil)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = Auth.auth().currentUser?.email!
        getDataFromDataBase()
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.visibleViewController?.title = "Profil"
        navigationItem.hidesBackButton = true
        menuShowing = false
        menuConstraint.constant = -250
        exitMenuConstraint.constant = -320
        exitMenuConstraint2.constant = 320
    }
    
}
