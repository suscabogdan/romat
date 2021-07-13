//
//  SecondViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Mihaela on 17/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabelGram: UILabel!
    @IBOutlet weak var teorieGram: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabelGram.text=parti[myIndex2]
        teorieGram.text=partiDesc[myIndex2]
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}
