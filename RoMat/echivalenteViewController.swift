//
//  echivalenteViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/03/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class echivalenteViewController: UIViewController, UITextFieldDelegate {

    var a = 0
    var b = 0
    var r1 = 0
    
    var c = 0
    var d = 0
    var r2 = 0
    
    var w = 0
    var x = 0
    var y = 0
    var z = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var numarator1: UITextField!
    @IBOutlet weak var numitor1: UITextField!
    @IBOutlet weak var numarator2: UITextField!
    @IBOutlet weak var numitor2: UITextField!
    @IBAction func calculeaza(_ sender: Any) {
        if numarator1.text != "" && numitor1.text != "" && numarator2.text != "" && numitor2.text != ""
        {
            label.text = ""
            a = Int(numarator1.text!)!
            b = Int(numitor1.text!)!
            c = Int(numarator2.text!)!
            d = Int(numitor2.text!)!
            w = a
            x = b
            y = c
            z = d
            if String(a).count <= 10 && String(b).count <= 10 && String(c).count <= 10 && String(d).count <= 10
            {
                if a * d == b * c
                {
                    label.text = "Fractiile sunt echivalente deoarece:\n" + String(a) + " * " + String(d) + " = " + String(b) + " * " + String(c) + " = " + String(a*d)
                }
                else
                {
                    label.text = "Fractiile nu sunt echivalente deoarece:\n" + String(a) + " * " + String(d) + " = " + String(a*d) + "\n" + String(b) + " * " + String(c) + " = " + String(b*c) + "\n=>  " + String(a) + " * " + String(d) + " ≠ " + String(b) + " * " + String(c)
                }
            }
            else if String(a).count <= 10 && String(b).count <= 10 && String(c).count <= 10 && String(d).count > 10
            {
                label.text = "Numitorul de la fractia 2 are valoarea prea mare."
            }
            else if String(a).count <= 10 && String(b).count <= 10 && String(c).count > 10 && String(d).count > 10
            {
                label.text = "Numaratorul si numitorul de la fractia 2 au valori prea mari."
            }
            else if String(a).count <= 10 && String(b).count > 10 && String(c).count > 10 && String(d).count > 10
            {
                label.text = "Numitorul de la fractia 1 si numaratorul si numitorul de la fractia 2 au valori prea mari."
            }
            else if String(a).count > 10 && String(b).count > 10 && String(c).count > 10 && String(d).count > 10
            {
                label.text = "Numaratorul si numitorul de la ambele fractii au valori prea mari."
            }
            else if String(a).count <= 10 && String(b).count <= 10 && String(c).count > 10 && String(d).count <= 10
            {
                label.text = "Numaratorul de la fractia 2 are valoarea prea mare."
            }
            else if String(a).count <= 10 && String(b).count > 10 && String(c).count <= 10 && String(d).count <= 10
            {
                label.text = "Numitorul de la fractia 1 are valoarea prea mare."
            }
            else if String(a).count > 10 && String(b).count <= 10 && String(c).count <= 10 && String(d).count <= 10
            {
                label.text = "Numaratorul de la fractia 1 are valoarea prea mare."
            }
            else if String(a).count > 10 && String(b).count > 10 && String(c).count <= 10 && String(d).count <= 10
            {
                label.text = "Numaratorul si numitorul de la fractia 1 au valori prea mari."
            }
            else if String(a).count > 10 && String(b).count > 10 && String(c).count > 10 && String(d).count <= 10
            {
                label.text = "Numaratorul si numitorul de la fractia 1 ai numaratorul de la fractia 2 au valori prea mari."
            }
            else if String(a).count > 10 && String(b).count <= 10 && String(c).count > 10 && String(d).count <= 10
            {
                label.text = "Numaratorii de la ambele fractii au valori prea mari."
            }
            else if String(a).count > 10 && String(b).count <= 10 && String(c).count <= 10 && String(d).count > 10
            {
                label.text = "Numaratorul de la fractia 1 si numitorul de la fractia 2 au valori prea mari."
            }
            else if String(a).count <= 10 && String(b).count > 10 && String(c).count > 10 && String(d).count <= 10
            {
                label.text = "Numitorul de la fractia 1 si numaratorul de la fractia 2 au valori prea mari."
            }
            else if String(a).count <= 10 && String(b).count > 10 && String(c).count <= 10 && String(d).count > 10
            {
                label.text = "Numitorii de la ambele fractii au valori prea mari."
            }
            else if String(a).count > 10 && String(b).count <= 10 && String(c).count > 10 && String(d).count > 10
            {
                label.text = "Numaratorul de la fractia 1 si numitorul si numaratorul de la fractia 2 au valori prea mari."
            }
            else if String(a).count > 10 && String(b).count > 10 && String(c).count <= 10 && String(d).count > 10
            {
                label.text = "Numaratorul si numitorul de la fractia 1 si numitorul de la fractia 2 au valori prea mari."
            }
        }
            
            
        else if numarator1.text != "" && numitor1.text != "" && numarator2.text != "" && numitor2.text == ""
        {
            label.text = "Scrie numitorul de la fractia 2."
        }
        else if numarator1.text != "" && numitor1.text != "" && numarator2.text == "" && numitor2.text == ""
        {
            label.text = "Scrie numaratorul si numitorul de la fractia 2."
        }
        else if numarator1.text != "" && numitor1.text == "" && numarator2.text == "" && numitor2.text == ""
        {
            label.text = "Scrie numitorul de la fractia 1 si numaratorul si numitorul de la fractia 2."
        }
        else if numarator1.text == "" && numitor1.text == "" && numarator2.text == "" && numitor2.text == ""
        {
            label.text = "Scrie numaratorul si numitorul celor doua fractii."
        }
        else if numarator1.text != "" && numitor1.text != "" && numarator2.text == "" && numitor2.text != ""
        {
            label.text = "Scrie numaratorul de la fractia 2."
        }
        else if numarator1.text != "" && numitor1.text == "" && numarator2.text != "" && numitor2.text != ""
        {
            label.text = "Scrie numitorul de la fractia 1."
        }
        else if numarator1.text == "" && numitor1.text != "" && numarator2.text != "" && numitor2.text != ""
        {
            label.text = "Scrie numaratorul de la fractia 1."
        }
        else if numarator1.text == "" && numitor1.text == "" && numarator2.text != "" && numitor2.text != ""
        {
            label.text = "Scrie numaratorul si numitorul de la fractia 1."
        }
        else if numarator1.text == "" && numitor1.text == "" && numarator2.text == "" && numitor2.text != ""
        {
            label.text = "Scrie numaratorul si numitorul de la fractia 1 ai numaratorul de la fractia 2."
        }
        else if numarator1.text == "" && numitor1.text != "" && numarator2.text == "" && numitor2.text != ""
        {
            label.text = "Scrie numaratorii de la ambele fractii."
        }
        else if numarator1.text == "" && numitor1.text != "" && numarator2.text != "" && numitor2.text == ""
        {
            label.text = "Scrie numaratorul de la fractia 1 si numitorul de la fractia 2."
        }
        else if numarator1.text != "" && numitor1.text == "" && numarator2.text == "" && numitor2.text != ""
        {
            label.text = "Scrie numitorul de la fractia 1 si numaratorul de la fractia 2."
        }
        else if numarator1.text != "" && numitor1.text == "" && numarator2.text != "" && numitor2.text == ""
        {
            label.text = "Scrie numitorii de la ambele fractii."
        }
        else if numarator1.text == "" && numitor1.text != "" && numarator2.text == "" && numitor2.text == ""
        {
            label.text = "Scrie numaratorul de la fractia 1 si numitorul si numaratorul de la fractia 2."
        }
        else if numarator1.text == "" && numitor1.text == "" && numarator2.text != "" && numitor2.text != ""
        {
            label.text = "Scrie numaratorul si numitorul de la fractia 1 si numitorul de la fractia 2."
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numarator1.resignFirstResponder()
        numitor1.resignFirstResponder()
        numarator2.resignFirstResponder()
        numitor2.resignFirstResponder()
        
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
