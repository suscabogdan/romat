//
//  progresViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 15/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import UIKit
import Foundation
import Macaw

struct progres {
    var materie:String
    var procent:Int
}

class progresViewController: UIViewController {
    
    @IBOutlet weak var chartView: MacawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.contentMode = .scaleAspectFit
        macawChartView.playAnimations()
    }
    
}
