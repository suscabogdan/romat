//
//  moreViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 20/05/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import GoogleMobileAds
import MessageUI

var contactInterstitial = 1

class moreViewController: UIViewController, GADBannerViewDelegate {
    
    var menuShowing = false
    
    var checkIfAnimationOccured1:Bool = false
    
    var checkIfAnimationOccured2:Bool = false
    
    @IBOutlet weak var myBanner: GADBannerView!
    
    @IBOutlet weak var instagramButtonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var instagramNameConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var facebookButtonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var facebookNameConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mailIconConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var mailNameConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var exitMenuConstraint2: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBAction func showMenu(_ sender: Any) {
        showSideMenu()
    }
    
    @IBOutlet weak var exitMenuOutlet: UIButton!
    
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
        let mate = storyboard?.instantiateViewController(withIdentifier: "navigationProfil")
        present(mate!, animated: true, completion: nil)
    }
    
    @IBAction func emailButton(_ sender: Any) {
        writeEmail()
    }
    @IBAction func contactMenu(_ sender: Any) {
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
    
    func writeEmail() {
        guard MFMailComposeViewController.canSendMail()
        else
        {
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["sb.contact@yahoo.com"])
        composer.setSubject("RoMat Feedback")
        present(composer, animated: true)
    }
    
    @IBAction func facebook(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.facebook.com/RoMatSuscaBogdan/")! as URL, options: [:], completionHandler: nil)

    }
    
    @IBAction func instagram(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.instagram.com/romat65/")! as URL, options: [:], completionHandler: nil)
    }
    
    var interstitial: GADInterstitial!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 10
        
        // ads
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        myBanner.adUnitID = "ca-app-pub-9281407659455784/2956227878"
        myBanner.rootViewController = self
        myBanner.delegate = self
        myBanner.load(request)
        
        loadInterstitial()
        
        if checkIfAnimationOccured1 == false
        {
            //animateButtonsSetup()
            checkIfAnimationOccured1 = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.visibleViewController?.title = "Contact"
        navigationItem.hidesBackButton = true
        
        // ads
        
        contactInterstitial += 1
        if contactInterstitial % 5 == 0
        {
            showInterstitial()
            print(contactInterstitial)
            loadInterstitial()
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
    }
    
    func animateButtonsSetup()
    {
        instagramButtonConstraint.constant -= self.view.bounds.width
        instagramNameConstraint.constant -= self.view.bounds.width
        facebookButtonConstraint.constant -= self.view.bounds.width
        facebookNameConstraint.constant -= self.view.bounds.width
        mailIconConstraint.constant -= self.view.bounds.width
        mailNameConstraint.constant += self.view.bounds.width
    }
    
    func animateButtons()
    {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.instagramButtonConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.instagramButtonConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseOut, animations: {
            self.instagramButtonConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        ///
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.instagramNameConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.instagramNameConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseOut, animations: {
            self.instagramNameConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        ///akjkjahjhak
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.facebookButtonConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseOut, animations: {
            self.facebookButtonConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.7, options: .curveEaseOut, animations: {
            self.facebookButtonConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        ///
        
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.facebookNameConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseOut, animations: {
            self.facebookNameConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.7, options: .curveEaseOut, animations: {
            self.facebookNameConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        ///jkabkjsahkjakjhakjhkajh
        
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseOut, animations: {
            self.mailIconConstraint.constant += self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.9, options: .curveEaseOut, animations: {
            self.mailIconConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseOut, animations: {
            self.mailIconConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        ///
        
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseOut, animations: {
            self.mailNameConstraint.constant -= self.view.bounds.width
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0.9, options: .curveEaseOut, animations: {
            self.mailNameConstraint.constant += 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveEaseOut, animations: {
            self.mailNameConstraint.constant -= 50
            
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}

extension moreViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true, completion: nil)
            return
        }
        switch result {
            case .cancelled:
                print("email cancelled")
            case .failed:
                print("email failed")
            case .saved:
                print("email saved")
            case .sent:
                print("email sent")
        }
        controller.dismiss(animated: true, completion: nil)
    }
}
