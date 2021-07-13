//
//  mainViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 17/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Firebase

var mainRoInterstitial = 1

var boolForAnimationLiteratura = false
var boolForAnimationGramatica = false

class mainRoViewController: UIViewController, GADBannerViewDelegate {
    
    var menuShowing = false
    
    @IBAction func literatura(_ sender: Any) {
        boolForAnimationLiteratura = true
    }
    
    @IBAction func gramatica(_ sender: Any) {
        boolForAnimationGramatica = true
    }
    var checkIfAnimationOccured1:Bool = false
    
    var checkIfAnimationOccured2:Bool = false
    
    @IBOutlet weak var teorieLabelConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var literaturaConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var gramaticaConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var unelteLabelConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var ciornaConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var subiecteConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var argumentareConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var argumentareConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var myBanner: GADBannerView!
    
    @IBOutlet weak var menuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var exitMenuOutlet: UIButton!
    
    @IBAction func exitMenu(_ sender: Any) {
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
        menuShowing = !menuShowing
    }
    
    @IBAction func romanaMenu(_ sender: Any) {
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
        menuShowing = !menuShowing
    }

    @IBAction func mateMenu(_ sender: Any) {
        let mate = storyboard?.instantiateViewController(withIdentifier: "navigationMate")
        present(mate!, animated: true, completion: nil)
    }
    
    @IBAction func profilMenu(_ sender: Any) {
        let mate = storyboard?.instantiateViewController(withIdentifier: "navigationProfil")
        present(mate!, animated: true, completion: nil)
    }
    
    @IBAction func contactMenu(_ sender: Any) {
        let mate = storyboard?.instantiateViewController(withIdentifier: "navigationContact")
        present(mate!, animated: true, completion: nil)
    }
    
    var interstitial: GADInterstitial!
    
    @IBAction func menuButton(_ sender: Any) {
        showSideMenu()
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
    
    /*
     adUnitId for testing: ca-app-pub-3940256099942544/4411468910
     adUnitId for real ad: ca-app-pub-9281407659455784/1127309297
    */
    
    func showInterstitial()
    {
        if interstitial.isReady
        {
            interstitial.present(fromRootViewController: self)
        }
        else
        {
            print("Failed to show ad")
        }
    }
    
    func loadInterstitial()
    {
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-9281407659455784/1127309297")
        interstitial.load(GADRequest())
    }
    
    func isLoggedIn() -> Bool
    {
        let verificare = UserDefaults.standard
        if verificare.value(forKey: "verificareLogare") != nil
        {
            let valoare = verificare.value(forKey: "verificareLogare") as! NSInteger
            if valoare == 1
            {
                return true
            }
            else
            {
                return false
            }
        }
        else
        {
            return false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference(fromURL: "https://romat-database.firebaseio.com/")
        let usersReference = ref.child("Clase").childByAutoId()
        let values = ["Email": email]
        usersReference.updateChildValues(values, withCompletionBlock: { (err, ref ) in
            if err != nil
            {
                print(err!)
            }
            else
            {
                print("Succes!")
            }
        })
        
        if isLoggedIn() == false
        {
            let login = storyboard?.instantiateViewController(withIdentifier: "inregistrare")
            present(login!, animated: true, completion: nil)
        }
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 10
        
        // ads
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        myBanner.adUnitID = "ca-app-pub-9281407659455784/6394740007"
        myBanner.rootViewController = self
        myBanner.delegate = self
        myBanner.load(request)
        
        loadInterstitial()
        
        setupNavBar()
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "wallpaper.png")!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationItem.hidesBackButton = true
        
        if checkIfAnimationOccured1 == false
        {
            //initAnimateNuttons()
            checkIfAnimationOccured1 = true
        }
        
        menuShowing = false
        menuConstraint.constant = -250
        exitMenuConstraint.constant = -320
        exitMenuConstraint2.constant = 320
        
        if checkIfAnimationOccured2 == false
        {
            //animateButtons()
            checkIfAnimationOccured2 = true
        }
        
//        self.navigationController?.title = "Română"
//
//        let menuButton = UIBarButtonItem(image: UIImage(named: "menu-button-of-three-horizontal-lines"), style: .plain, target: self, action: Selector(("showSideMenu")))
//        self.navigationController?.navigationItem.rightBarButtonItem = menuButton
        
        // ads
        
        mainRoInterstitial += 1
        if mainRoInterstitial % 6 == 0
        {
            showInterstitial()
            print(mainRoInterstitial)
            loadInterstitial()
        }
    }
    
    func setupNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    func initAnimateNuttons()
    {
        teorieLabelConstraint.constant -= view.bounds.width
        literaturaConstraint.constant -= view.bounds.width
        gramaticaConstraint.constant -= view.bounds.width
        unelteLabelConstraint.constant -= view.bounds.width
        ciornaConstraint.constant -= view.bounds.width
        subiecteConstraint.constant -= view.bounds.width
        argumentareConstraint.constant -= view.bounds.width
        argumentareConstraint2.constant += view.bounds.width
    }
    
    func animateButtons()
    {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.teorieLabelConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.teorieLabelConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseOut, animations: {
            self.teorieLabelConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseOut, animations: {
            self.gramaticaConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.7, options: .curveEaseOut, animations: {
            self.gramaticaConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.8, options: .curveEaseOut, animations: {
            self.gramaticaConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.literaturaConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.8, options: .curveEaseOut, animations: {
            self.literaturaConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.9, options: .curveEaseOut, animations: {
            self.literaturaConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 0.7, options: .curveEaseOut, animations: {
            self.unelteLabelConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseOut, animations: {
            self.unelteLabelConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.1, options: .curveEaseOut, animations: {
            self.unelteLabelConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 1.2, options: .curveEaseOut, animations: {
            self.subiecteConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.5, options: .curveEaseOut, animations: {
            self.subiecteConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.6, options: .curveEaseOut, animations: {
            self.subiecteConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 1.3, options: .curveEaseOut, animations: {
            self.ciornaConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.6, options: .curveEaseOut, animations: {
            self.ciornaConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.7, options: .curveEaseOut, animations: {
            self.ciornaConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.3, delay: 1.4, options: .curveEaseOut, animations: {
            self.argumentareConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.7, options: .curveEaseOut, animations: {
            self.argumentareConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.8, options: .curveEaseOut, animations: {
            self.argumentareConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.4, options: .curveEaseOut, animations: {
            self.argumentareConstraint2.constant -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.7, options: .curveEaseOut, animations: {
            self.argumentareConstraint2.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.8, options: .curveEaseOut, animations: {
            self.argumentareConstraint2.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}


