//
//  quizViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Mihaela on 01/03/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import GoogleMobileAds

class quizViewController: UIViewController, GADBannerViewDelegate {

    @IBOutlet weak var myBanner: GADBannerView!
    
    @IBAction func start(_ sender: Any) {
        quizBool = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        quizBool = true
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        myBanner.adUnitID = "ca-app-pub-9281407659455784/6394740007"
        myBanner.rootViewController = self
        myBanner.delegate = self
        myBanner.load(request)
    }
}
