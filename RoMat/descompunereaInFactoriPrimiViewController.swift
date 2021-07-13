//
//  descompunereaInFactoriPrimiViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 30/04/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class descompunereaInFactoriPrimiViewController: UIViewController, UITextFieldDelegate {

    var n = 0
    var i = 0
    var x = 0
    var sw = 0
    var d = 0
    var p = 0
    var aux = 0
    
    // label = label-ul unde se scrie rezultatul final
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var numar: UITextField!
    // label = label-ul unde se scrie descompunerea ca si pe caiet
    @IBOutlet weak var rezultat: UILabel!
    @IBAction func calculeaza(_ sender: Any) {
        if numar.text != ""
        {
            rezultat.text = ""
            label.text = ""
            n = Int(numar.text!)!
            aux = n
            if String(n).count <= 9
            {
                if n > 1
                {
                    rezultat.text = ""
                    label.text = ""
                    x = n
                    i = 2
                    repeat
                    {
                        sw = 0
                        if x%i == 0
                        {
                            d = 2
                            while d <= i
                            {
                                if i%d == 0
                                {
                                    sw = 1;
                                }
                                d = d+1
                            }
                        }
                        if sw == 1
                        {
                            rezultat.text = rezultat.text! + String(x) + " | " + String(i) + "\n"
                            x = x/i
                        }
                        else if sw == 0
                        {
                            i = i+1
                        }
                    }while x != 1
                    rezultat.text = rezultat.text! + "1 |"
                    d = 2
                    while n > 1
                    {
                        p = 0
                        while n%d == 0
                        {
                            p = p+1
                            n = n/d
                    }
                        if p != 0
                        {
                            if label.text != ""
                            {
                                if p == 1
                                {
                                    label.text = label.text! + " * " + String(d)
                                }
                                else
                                {
                                    label.text = label.text! + " * " + String(d) + "^" + String(p)
                                }
                            }
                            else if label.text == ""
                            {
                                if p == 1
                                {
                                    label.text = String(aux) + " = " + String(d)
                                }
                                else
                                {
                                    label.text = String(aux) + " = " + String(d) + "^" + String(p)
                                }
                            }
                        }
                        d = d+1
                        if n > 1 && d*d > n
                        {
                            d = n
                        }
                    }
                }
                else if n == 1
                {
                    label.text = "1 = 1"
                    rezultat.text = "1 | 1" + "\n" + "1 |  "
                }
                else if n == 0
                {
                    label.text = ""
                    rezultat.text = "0 nu poate fi descompus in factori primi."
                }
            }
            else
            {
                rezultat.text = ""
                label.text = "Numarul este prea mare."
            }
        }
        else if numar.text == ""
        {
            rezultat.text = ""
            label.text = "Scrie un numar."
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
        numar.resignFirstResponder()
        
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
