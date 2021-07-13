//
//  scaraHartiaViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 05/03/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class scaraHartiaViewController: UIViewController, UITextFieldDelegate {

    var p:Double = 0
    var t:Double = 0
    var r:Double = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var rezultat: UILabel!
    @IBOutlet weak var mPretios: UITextField!
    @IBOutlet weak var mTotal: UITextField!
    
    @IBAction func calculeaza(_ sender: UIButton)
    {
        if mPretios.text != "" && mTotal.text != ""
        {
            p = Double(mPretios.text!)!
            t = Double(mTotal.text!)!
            if String(p).count <= 10 && String(t).count <= 10
            {
                label.text = ""
                r = p / t
                rezultat.text = String(r)
            }
            else if String(p).count <= 10 && String(t).count >= 10
            {
                label.text = "Distanta din teren este prea mare."
                rezultat.text = ""
            }
            else if String(p).count >= 10 && String(t).count <= 10
            {
                label.text = "Distanta de pe hata este prea mare."
            }
            else if String(p).count >= 10 && String(t).count >= 10
            {
                label.text = "Valorile sunt prea mari."
            }
        }
        else if mPretios.text != "" && mTotal.text == ""
        {
            label.text = "Scrie distanta din teren."
            rezultat.text = ""
        }
        else if mPretios.text == "" && mTotal.text != ""
        {
            label.text = "Scrie distanta de pe harta."
            rezultat.text = ""
        }
        if mPretios.text == "" && mTotal.text == ""
        {
            label.text = "Scrie distanta de pe harta si distanta din teren."
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mTotal.resignFirstResponder()
        mPretios.resignFirstResponder()
        
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
