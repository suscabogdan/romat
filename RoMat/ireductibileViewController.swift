//
//  ireductibileViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/03/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class ireductibileViewController: UIViewController, UITextFieldDelegate {

    var a = 0
    var b = 0
    var r = 0
    var x = 0
    var y = 0
    
    @IBOutlet weak var numarator: UITextField!
    @IBOutlet weak var numitor: UITextField!
    @IBOutlet weak var status: UILabel!
    @IBAction func calculeaza(_ sender: Any) {
        if numarator.text != "" && numitor.text != ""
        {
            status.text = ""
            a = Int(numarator.text!)!
            b = Int(numitor.text!)!
            x = a
            y = b
            if String(a).count <= 10 && String(b).count <= 10
            {
                if a % b != 0
                {
                    if a != 0 && b != 0
                    {
                        r = a % b
                        while r != 0
                        {
                            a = b
                            b = r
                            r = a % b
                        }
                        status.text = String(x / b) + " / " + String(y / b)
                        if b == 1
                        {
                            status.text = "Fractia este ireductibila."
                        }
                        else if b != 1
                        {
                            status.text = "Fractia " + String(x) + " / " + String(y) + " este reductibila cu " + String(b) + ", iar fractia obtinuta prin simplificare este " + String(x / b) + " / " + String(y / b) + "."
                        }
                    }
                }
                else if a % b == 0
                {
                    status.text = "Fractia " + String(x) + " / " + String(y) + " este reductibila cu " + String(b) + ", iar rezultatul obtinut in urma efectuarii impartirii este " + String(a / b) + "."
                }
            }
            else if String(a).count <= 10 && String(b).count < 10
            {
                status.text = "Numitorul este prea mare!"
            }
            else if String(a).count > 10 && String(b).count <= 10
            {
                status.text = "Numaratorul este prea mare!"
            }
            else if String(a).count > 10 && String(b).count > 10
            {
                status.text = "Valorile sunt prea mari!"
            }
        }
        else if numarator.text == "" && numitor.text != ""
        {
            status.text = "Scrie numaratorul."
        }
        else if numarator.text != "" && numitor.text == ""
        {
            status.text = "Scrie numitorul."
        }
        else if numarator.text == "" && numitor.text == ""
        {
            status.text = "Scrie numaratorul si numitorul."
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numarator.resignFirstResponder()
        numitor.resignFirstResponder()
        
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
