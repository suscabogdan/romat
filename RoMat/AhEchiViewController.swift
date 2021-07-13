
//
//  AhEchiViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class AhEchiViewController: UIViewController, UITextFieldDelegate {
    
    var l:Double = 0
    var b:Double = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var latura: UITextField!

    @IBAction func calculeaza(_ sender: UIButton)
    {
        if latura.text != ""
        {
            l = Double(latura.text!)!
            if String(l).count <= 10
            {
                b = l * l / 4
                label.text = "A = " + String(b) + "√3"
            }
            else
            {
                label.text = "Valoarea este prea mare."
            }
        }
        else if latura.text == ""
        {
            label.text = "Scrie valoarea lui L."
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        latura.resignFirstResponder()
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
        
    }
    
}
