//
//  ariaPatratuluiViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class ariaPatratuluiViewController: UIViewController, UITextFieldDelegate {

    var l = 0
    var a = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var latura: UITextField!
    
    @IBAction func calculeaza(_ sender: UIButton)
    {
        if latura.text != ""
        {
            l = Int(latura.text!)!
            if String(l).count <= 10
            {
                a = l * l
                label.text = "A = " + String(a)
            }
            else
            {
                label.text = "Valoarea este prea mare."
            }
        }
        else
        {
            label.text = "Scrie o valoare."
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        latura.resignFirstResponder()
        
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
