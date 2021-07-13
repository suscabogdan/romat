//
//  divizibilitateViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/03/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class divizibilitateViewController: UIViewController, UITextFieldDelegate {

    var a = 0
    var b = 0
    var i = 1
    var j = 1
    
    @IBOutlet weak var primulNumar: UITextField!
    @IBOutlet weak var alDoileaNumar: UITextField!
    @IBOutlet weak var rezultat: UILabel!
    @IBOutlet weak var da: UILabel!
    @IBOutlet weak var db: UILabel!
    @IBAction func verifica(_ sender: Any) {
        if primulNumar.text != "" && alDoileaNumar.text != ""
        {
            da.text = "Da = {"
            db.text = "Db = {"
            i = 1
            j = 1
            a = Int(primulNumar.text!)!
            b = Int(alDoileaNumar.text!)!
            if String(a).count <= 9 && String(b).count <= 9
            {
                if a > b
                {
                    if a % b == 0
                    {
                        rezultat.text = "Numarul " + String(a) + " este divizibil cu numarul " + String(b) + "."
                    }
                    else if a%b != 0
                    {
                        rezultat.text = "b∤a & a∤b"

                    }
                }
                else if b > a
                {
                    if b%a == 0
                    {
                        rezultat.text = "Numarul " + String(b) + " este divizibil cu numarul " + String(a) + "."
                    }
                    else if a%b != 0
                    {
                        rezultat.text = "b∤a & a∤b"

                    }
                }
                while i <= a
                {
                    if a % i == 0 && i != a
                    {
                        da.text = da.text! + String(i) + ", "
                    }
                    else if i == a
                    {
                        da.text = da.text! + String(i) + "}"
                    }
                    i = i + 1
                }
                while j <= b
                {
                    if b % j == 0 && j != b
                    {
                        db.text = db.text! + String(j) + ", "
                    }
                    else if j == b
                    {
                        db.text = db.text! + String(j) + "}"
                    }
                    j = j + 1
                }
            }
            else if String(a).count > 9 && String(b).count > 9
            {
                da.text = ""
                db.text = ""
                rezultat.text = "Numerele sunt prea mari!"
            }
            else if String(a).count > 9 && String(b).count <= 9
            {
                da.text = ""
                db.text = ""
                rezultat.text = "Numarul a este prea mare!"
            }
            else if String(a).count <= 9 && String(b).count > 9
            {
                da.text = ""
                db.text = ""
                rezultat.text = "Numarul b este prea mare!"
            }
        }
        else if primulNumar.text != "" && alDoileaNumar.text == ""
        {
            da.text = ""
            db.text = ""
            rezultat.text = "Scrie numarul b."
        }
        else if primulNumar.text == "" && alDoileaNumar.text != ""
        {
            da.text = ""
            db.text = ""
            rezultat.text = "Scrie numarul a."
        }
        else if primulNumar.text == "" && alDoileaNumar.text == ""
        {
            da.text = ""
            db.text = ""
            rezultat.text = "Scrie a si b."
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
        primulNumar.resignFirstResponder()
        alDoileaNumar.resignFirstResponder()
        
        return true
    }
 
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
