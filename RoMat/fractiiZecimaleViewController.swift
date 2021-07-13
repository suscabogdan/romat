//
//  fractiiZecimaleViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/03/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class fractiiZecimaleViewController: UIViewController, UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
