//
//  navigationController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 11/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import Foundation
import UIKit

class navigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        let isLoggedIn = false
        
        if isLoggedIn
        {
            let homeController = mainRoViewController()
            viewControllers = [homeController]
        }
        else
        {
            perform(#selector(showLogginController), with: nil, afterDelay: 0.01)
        }
    }
    
    @objc func  showLogginController()
    {
        let logginController = mainPageViewController()
        present(logginController, animated: true, completion: nil)
    }
    
}

//class HomeController: UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .yellow
//    }
//    
//}
