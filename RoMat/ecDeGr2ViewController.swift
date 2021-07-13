//
//  ecDeGr2ViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 03/05/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class ecDeGr2ViewController: UIViewController, UITextFieldDelegate {

    var a = 0
    var b = 0
    var c = 0
    var delta = 0
    var x:Double = 0
    var x1:Double = 0
    var x2:Double = 0
    var radDelta:Double = 0
    var i:Int = 0
    var sw = 0
    
    @IBOutlet weak var teorie: UILabel!
    @IBOutlet weak var atext: UITextField!
    @IBOutlet weak var btext: UITextField!
    @IBOutlet weak var ctext: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBAction func calculeaza(_ sender: Any) {
        if atext.text != "" && btext.text != "" && ctext.text != ""
        {
            a = Int(atext.text!)!
            b = Int(btext.text!)!
            c = Int(ctext.text!)!
            if String(a).count <= 4 && String(b).count <= 4 && String(c).count <= 4
            {
                if 0 == a
                {
                    if 0 == b
                    {
                        if 0 == c
                        {
                            label.text = "Exista o infinitate de solutii."
                        }
                        else if 0 != c
                        {
                            label.text = "Ecuatia este imposibila."
                        }
                    }
                    else if 0 != b
                    {
                        x = Double(-c/b)
                        label.text = "Ecuatia este de gradul I si are solutia:" + "\n" + "x = " + String(x)
                    }
                }
                else if 0 != a
                {
                    delta = b * b - 4 * a * c
                    if 0 > delta
                    {

                        label.text = "Δ = " + String(delta) + "\n" + "Ecuatia nu are solutii reale pentru ca Δ < 0."
                    }
                    else if 0 == delta
                    {
                        x = Double(-b / 2 * a)
                        label.text = "Δ = 0" + "\n" + "Δ = 0 deci ecuatia are o singura solutie reala:" + "\n" +  "x = " + String(x)
                    }
                    else if 0 < delta
                    {
                        sw = 0
                        i = 0
                        while i <= delta
                        {
                            if i * i == delta
                            {
                                sw = 1
                            }
                            i = i + 1
                        }
                        x1=(Double(-b)+sqrt(Double(delta)))/2*Double(a)
                        x2=(Double(-b)-sqrt(Double(delta)))/2*Double(a)
                        if sw == 1
                        {
                            label.text = "Δ = " + String(delta) + "\n" + "Δ > 0 deci ecuatia are 2 solutii reale:" + "\n" + "x1 = " + String(x1) + "\n" + "x2 = " + String(x2)
                        }
                        // Δ √ ±
                        else if sw == 0
                        {
                            label.text = "Δ = " + String(delta) + "\n" + "Δ > 0 deci ecuatia are 2 solutii reale:" + "\n" + "x1 = (-" + String(b) + " + √" + String(delta) + ") / " + String(2*a) + "\nx1 = " + String(x1) + "\n\n" + "x2 = (-" + String(b) + " - √" + String(delta) + ") / " + String(2*a) + "\nx2 = " + String(x2)
                        }
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teorie.text = "ax² + bx + c = 0\nΔ = b² - 4ac\nx1,2 = (- b ± √Δ) / (2a)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        atext.resignFirstResponder()
        btext.resignFirstResponder()
        ctext.resignFirstResponder()
        
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
