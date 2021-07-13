//
//  sferaViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 09/05/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class sferaViewController: UIViewController, UITextFieldDelegate {

    var v:Double = 0
    var a = 0
    var r = 0
    var rDoub:Double = 0
    var rString:String = ""
    
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var raza: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func calculeaza(_ sender: Any) {
        if raza.text != ""
        {
            label.text = ""
            rString = raza.text!
            if rString.count <= 9
            {
                r = Int(raza.text!)!
                rDoub = Double(r)
                volum()
                arie()
            }
            else
            {
                label.text = "Valoarea razei este prea mare."
            }
        }
        else
        {
            label.text = "Scrie raza."
        }
    }
    
    // Functia care calculeaza volumul sferei
    func volum() {
        v = Double((4 * rDoub * rDoub * rDoub) / 3)
        label.text = label.text! + "V = " + String(Double(v)) + "π cm³" + "\n"
    }
    
    // Functia care calculeaza aria sferei
    func arie() {
        a = 4 * r * r
        label.text = label.text! + "A = " + String(a) + "π cm²"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        startLabel.text = "V = 4πr³ / 3\nA = 4πr²"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        raza.resignFirstResponder()
        
        return true
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return false
    }
    
}
