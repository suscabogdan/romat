//
//  algebraViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 08/05/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class algebraViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = subiect[myIndex]
        myImageView.image = UIImage(named: "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
