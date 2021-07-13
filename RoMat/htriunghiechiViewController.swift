//
//  htriunghiechiViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class htriunghiechiViewController: UIViewController, UITextFieldDelegate {

    var l:Double = 0
    var a:Double = 0
    
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var valoare: UITextField!
    @IBAction func calculeaza(_ sender: UIButton)
    {
        if valoare.text != ""
        {
            l = Double(valoare.text!)!
            if String(l).count <= 10
            {
                a = l / 2
                label.text = "h = " + String(a) + "√3"
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
        valoare.resignFirstResponder()
        
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
