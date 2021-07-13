//
//  ariaTriunghiuluiViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 25/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class ariaTriunghiuluiViewController: UIViewController, UITextFieldDelegate {

    var inaltime:Double = 0;
    var baza:Double = 0;
    var aria:Double = 0;
    
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var h: UITextField!
    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func calculeaza(_ sender: UIButton)
    {
        if b.text != "" && h.text != ""
        {
        inaltime = Double(h.text!)!
        baza = Double(b.text!)!
        aria = inaltime * baza / 2
            label.text = "A =" + String(inaltime * baza / 2)
        }
        else if b.text == "" && h.text != ""
        {
            label.text = "Scrie b."
        }
        else if b.text != "" && h.text == ""
        {
            label.text = "Scrie h."
        }
        else if b.text == "" && h.text == ""
        {
            label.text = "Scrie b si h."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.b.delegate = self
        self.h.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        h.resignFirstResponder()
        b.resignFirstResponder()
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
