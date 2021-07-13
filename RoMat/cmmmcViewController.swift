//
//  cmmmcViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class cmmmcViewController: UIViewController, UITextFieldDelegate {

    var a = 0
    var b = 0
    var p = 0
    var p2 = 0
    var r = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var nr1: UITextField!
    @IBOutlet weak var nr2: UITextField!
    
    @IBAction func verifica(_ sender: UIButton)
    {
        if nr1.text != "" && nr2.text != ""
        {
            label.text = ""
            a = Int(nr1.text!)!
            b = Int(nr2.text!)!
            if String(a).count <= 10 && String(b).count <= 10
                {
                    if a != 0 && b != 0
                    {
                        p = a * b
                        r = a%b
                        while r != 0
                        {
                            a = b
                            b = r
                            r = a%b
                        }
                        p2 = p / b
                        label.text = "C.M.M.M.C. = " + String(p2)
                    }
                    else if a == 0 || b == 0
                    {
                        label.text = "C.M.M.M.C. = 0"
                    }
                }
            else if String(a).count <= 10 && String(b).count >= 10
            {
                label.text = "Numarul 2 este prea mare."
            }
            else if String(a).count >= 10 && String(b).count <= 10
            {
                label.text = "Numarul 1 este prea mare."
            }
            else if String(a).count >= 10 && String(b).count >= 10
            {
                label.text = "Numerele sunt prea mari."
            }
        }
        else if nr1.text != "" && nr2.text == ""
        {
            label.text = "Scrie numarul 2."
        }
        else if nr1.text == "" && nr2.text != ""
        {
            label.text = "Scrie numarul 1."
        }
        else if nr1.text == "" && nr2.text == ""
        {
            label.text = "Scrie doua numere."
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
        nr1.resignFirstResponder()
        nr2.resignFirstResponder()
        
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
