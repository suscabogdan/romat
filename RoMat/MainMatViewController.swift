//
//  MainMatViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 19/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import GoogleMobileAds

var mainMatInterstitial = 1

var boolForAnimationAlgebra = false
var boolForAnimationGeometrie = false

class MainMatViewController: UIViewController, GADBannerViewDelegate {
    
    var menuShowing = false
    
    var checkIfAnimationOccured1:Bool = false
    
    var checkIfAnimationOccured2:Bool = false
    
    @IBAction func algebra(_ sender: Any) {
        boolForAnimationAlgebra = true
    }
    
    @IBAction func geometrie(_ sender: Any) {
        boolForAnimationGeometrie = true
    }
    
    @IBOutlet weak var teorieLabelConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var algebraConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var geometrieConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var unelteConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var calculatoareConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var subiecteConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var myBanner: GADBannerView!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var menuConstraint: NSLayoutConstraint!
    @IBOutlet weak var exitMenuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuOutlet: UIButton!
    
    @IBAction func exitMenu(_ sender: Any) {
        showSideMenu()
    }
    
    @IBAction func matematicaMenu(_ sender: Any) {
        showSideMenu()
    }
    
    @IBAction func showMenu(_ sender: Any) {
        showSideMenu()
    }
    
    @IBAction func romanaMenu(_ sender: Any) {
        let mate = storyboard?.instantiateViewController(withIdentifier: "navigation")
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
    
    var interstitial: GADInterstitial!
    
    /*
     adUnitId for testing: ca-app-pub-3940256099942544/4411468910
     adUnitId for real ad: ca-app-pub-9281407659455784/1127309297
     */
    
    // ads
    
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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 10
        
        // ads
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        myBanner.adUnitID = "ca-app-pub-9281407659455784/5319092366"
        myBanner.rootViewController = self
        myBanner.delegate = self
        myBanner.load(request)
        navigationController?.navigationBar.prefersLargeTitles = true
        
        loadInterstitial()
        
        if checkIfAnimationOccured1 == false
        {
            //setButtonsForAnimations()
            checkIfAnimationOccured1 = true
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        menuShowing = false
        menuConstraint.constant = -250
        exitMenuConstraint.constant = -320
        exitMenuConstraint2.constant = 320
        self.navigationController?.visibleViewController?.title = "Matematică"
        
        navigationItem.hidesBackButton = true
        
        // ads
        
        mainMatInterstitial += 1
        if mainMatInterstitial % 6 == 0
        {
            showInterstitial()
            print(mainMatInterstitial)
            loadInterstitial()
        }
        
        if checkIfAnimationOccured2 == false
        {
            //animateButtons()
            checkIfAnimationOccured2 = true
        }
    }
    
    func setButtonsForAnimations()
    {
        teorieLabelConstraint.constant += view.bounds.width
        algebraConstraint.constant += view.bounds.width
        geometrieConstraint2.constant += view.bounds.width
        unelteConstraint.constant += view.bounds.width
        calculatoareConstraint.constant += view.bounds.width
        subiecteConstraint.constant += view.bounds.width
    }
    
    func animateButtons()
    {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.teorieLabelConstraint.constant -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.teorieLabelConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseOut, animations: {
            self.teorieLabelConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseOut, animations: {
            self.algebraConstraint.constant -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.7, options: .curveEaseOut, animations: {
            self.algebraConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.8, options: .curveEaseOut, animations: {
            self.algebraConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.geometrieConstraint2.constant -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.8, options: .curveEaseOut, animations: {
            self.geometrieConstraint2.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.9, options: .curveEaseOut, animations: {
            self.geometrieConstraint2.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.7, options: .curveEaseOut, animations: {
            self.unelteConstraint.constant -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseOut, animations: {
            self.unelteConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.1, options: .curveEaseOut, animations: {
            self.unelteConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.2, options: .curveEaseOut, animations: {
            self.calculatoareConstraint.constant -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.5, options: .curveEaseOut, animations: {
            self.calculatoareConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.6, options: .curveEaseOut, animations: {
            self.calculatoareConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.3, options: .curveEaseOut, animations: {
            self.subiecteConstraint.constant -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.6, options: .curveEaseOut, animations: {
            self.subiecteConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1.7, options: .curveEaseOut, animations: {
            self.subiecteConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
