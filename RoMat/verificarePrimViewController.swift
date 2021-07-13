//
//  verificarePrimViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 24/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class verificarePrimViewController: UIViewController, UITextFieldDelegate {
    
    var n = 0;
    var nr:Double = 0;
    var i = 2;
    var c = 0;
    var nString:String = ""
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var numar: UITextField!
    @IBAction func verifica(_ sender: UIButton)
    {
        c = 0;
        i = 2;
        if numar.text != ""
        {
            label.text = ""
            nString = numar.text!
            if nString.count <= 11
            {
                n = Int(nString)!
                if n == 0
                {
                    label.text = "0 nu este nici prim nici compus."
                }
                else if n == 1
                {
                    label.text = "Numarul " + String(n) + " nu este prim."
                }
                else
                {
                    while i < n
                    {
                        if(n%i == 0)
                        {
                            c = c + 1;
                        }
                        i = i + 1;
                    }
                    if c == 0
                    {
                        label.text = "Numarul " + String(n) + " este prim."
                    }
                    else
                    {
                        label.text = "Numarul " + String(n) + " nu este prim."
                    }
                }
            }
            else
            {
                label.text = "Numarul " + String(n) + " este prea mare."
            }
        }
        else
        {
            label.text = "Scrie un numar."
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
        numar.resignFirstResponder()
        
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
