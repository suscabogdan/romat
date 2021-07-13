//
//  teoremaImpartiriiCuRestViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 02/05/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class teoremaImpartiriiCuRestViewController: UIViewController, UITextFieldDelegate {

    var a = 0
    var b = 0
    var bString:String = ""
    var c = 0
    var cString:String = ""
    var r = 0
    var rString:String = ""
    
    @IBOutlet weak var labelTeorie: UILabel!
    @IBOutlet weak var btext: UITextField!
    @IBOutlet weak var ctext: UITextField!
    @IBOutlet weak var rtext: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func calculeaza(_ sender: Any) {
        if btext.text != "" && ctext.text != "" && rtext.text != ""
        {
            bString = btext.text!
            cString = ctext.text!
            rString = rtext.text!
            if bString.count <= 9 && cString.count <= 9 && rString.count <= 9
            {
                b = Int(btext.text!)!
                c = Int(ctext.text!)!
                r = Int(rtext.text!)!
                if r < b
                {
                    a = b * c + r
                    label.text = "a = " + String(a)
                }
                else if r >= b
                {
                    label.text = "r este mai mare decat b."
                }
            }
            else if String(b).count <= 9 && String(c).count <= 9 && String(r).count > 9
            {
                label.text = "r este prea mare."
            }
            else if String(b).count <= 9 && String(c).count > 9 && String(r).count <= 9
            {
                label.text = "c este prea mare."
            }
            else if String(b).count > 9 && String(c).count <= 9 && String(r).count <= 9
            {
                label.text = "b este prea mare"
            }
            else if String(b).count <= 9 && String(c).count > 9 && String(r).count > 9
            {
                label.text = "c si r sunt prea mari."
            }
            else if String(b).count > 9 && String(c).count > 9 && String(r).count > 9
            {
                label.text = "Numerele sunt prea mari."
            }
            else if String(b).count > 9 && String(c).count > 9 && String(r).count <= 9
            {
                label.text = "b si c sunt prea mari."
            }
            else if String(b).count > 9 && String(c).count <= 9 && String(r).count > 9
            {
                label.text = "b si r sunt prea mari."
            }
            else if String(b).count > 9 && String(c).count > 9 && String(r).count <= 9
            {
                label.text = "b si c sunt prea mari."
            }
        }
        else if btext.text != "" && ctext.text != "" && rtext.text == ""
        {
            label.text = "Scrie r."
        }
        else if btext.text == "" && ctext.text != "" && rtext.text == ""
        {
            label.text = "Scrie b si r."
        }
        else if btext.text == "" && ctext.text == "" && rtext.text == ""
        {
            label.text = "Scrie valorile."
        }
        else if btext.text != "" && ctext.text == "" && rtext.text != ""
        {
            label.text = "Scrie c."
        }
        else if btext.text == "" && ctext.text != "" && rtext.text != ""
        {
            label.text = "Scrie b."
        }
        else if btext.text != "" && ctext.text == "" && rtext.text == ""
        {
            label.text = "Scrie c si r."
        }
        else if btext.text == "" && ctext.text == "" && rtext.text != ""
        {
            label.text = "Scrie b si c."
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelTeorie.text = "a : b = c,  r\nr < b\na = b * c + r\nEx:   5 : 3 = 1  r 2"
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
        btext.resignFirstResponder()
        ctext.resignFirstResponder()
        rtext.resignFirstResponder()
        
        return true
    }
    
    override var prefersStatusBarHidden: Bool
    {
        return false
    }
    
}
