//
//  probabilitateaViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class probabilitateaViewController: UIViewController, UITextFieldDelegate {

    var f:Double = 0
    var p:Double = 0
    var r:Double = 0
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cazFav: UITextField!
    @IBOutlet weak var cazPos: UITextField!
    @IBOutlet weak var rezultat: UILabel!
    @IBAction func calculeaza(_ sender: UIButton)
    {
        if cazFav.text != "" && cazPos.text != ""
        {
            f = Double(cazFav.text!)!
            p = Double(cazPos.text!)!
            if String(f).count <= 10 && String(p).count <= 10
            {
                label.text = ""
                r = f / p
                rezultat.text = " = " + String(r)
            }
            else if String(f).count <= 10 && String(p).count >= 10
            {
                label.text = "Numarul de cazuri posibile este prea mare."
                rezultat.text = ""
            }
            else if String(f).count >= 10 && String(p).count <= 10
            {
                label.text = "Numarul de cazuri favorabile este prea mare."
                rezultat.text = ""
            }
        }
        else if cazFav.text != "" && cazPos.text == ""
        {
            label.text = "Scrie numarul de cazuri posibile."
            rezultat.text = ""
        }
        else if cazFav.text == "" && cazPos.text != ""
        {
            label.text = "Scrie numarul de cazuri favorabile."
            rezultat.text = ""
        }
        else if cazFav.text == "" && cazPos.text == ""
        {
            label.text = "Scrie numarul de cazuri favorabile si numarul de cazuri posibile."
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
        cazFav.resignFirstResponder()
        cazPos.resignFirstResponder()
        
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
