//
//  primeIntreEleViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 26/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class primeIntreEleViewController: UIViewController, UITextFieldDelegate {

    var a:Double = 0;
    var b:Double = 0;
    var aString:String = ""
    var bString:String = ""
    var i = 2;
    var r = 0;
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var numar1: UITextField!
    @IBOutlet weak var numar2: UITextField!
    
    @IBAction func verifica(_ sender: UIButton)
    {
        if numar1.text != "" && numar2.text != ""
        {
            aString = numar1.text!
            bString = numar2.text!
            i = 2;
            if aString.count <= 8 && bString.count <= 8
            {
                a = Double(aString)!
                b = Double(bString)!
                if a > 0 && b > 0
                {
                    while a != b
                    {
                        if a > b
                        {
                            a = a - b
                        }
                        else
                        {
                            b = b - a
                        }
                    }
                    if a == 1
                    {
                        label.text = "Numerele sunt prime intre ele."
                    }
                    else
                    {
                        label.text = "Numerele nu sunt prime intre ele."
                    }
                }
            }
            else if aString.count >= 7 && bString.count <= 8
            {
                label.text = "Numarul 1 este prea mare."
            }
            else if aString.count <= 8 && bString.count >= 7
            {
                label.text = "Numarul 2 este prea mare."
            }
            else if aString.count >= 7 && bString.count >= 7
            {
                label.text = "Numerele sunt prea mari."
            }
        }
        else if numar1.text != "" && numar2.text == ""
        {
            label.text = "Scrie numarul 2."
        }
        else if numar1.text == "" && numar2.text != ""
        {
            label.text = "Scrie numarul 1."
        }
        else if numar1.text == "" && numar2.text == ""
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
        numar1.resignFirstResponder()
        numar2.resignFirstResponder()
        
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
