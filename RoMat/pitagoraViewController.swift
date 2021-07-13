//
//  pitagoraViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 24/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class pitagoraViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var cateta1: UITextField!
    @IBOutlet weak var cateta2: UITextField!
    
    var ip = 0;
    var ipStr:String = "";
    var c1:Double = 0;
    var c1String:String = ""
    var c2:Double = 0;
    var c2String:String = ""
    var pAfara:Double = 0
    var pSub:Double = 0
    var d:Double = 0
    var i = 0
    var nr = 0
    var p:Double = 0
    var afara = 0
    var sub = 0
    var iint = 0
    
    func scoatereDeSubRadical() {
        pAfara = 1
        pSub = 1
        d = 2
        p = Double(ip)
        i = Int(p)
        while d <= p
        {
            if p.truncatingRemainder(dividingBy: d) == 0
            {
                nr = 0
                while p.truncatingRemainder(dividingBy: d) == 0
                {
                    nr = nr+1
                    p = p/d
                    if 2 == nr
                    {
                        pAfara = pAfara * d
                        nr = 0
                    }
                }
                if 1 == nr
                {
                    pSub = pSub * d
                }
            }
            else
            {
                d = d+1
            }
        }
    }
    
    @IBAction func calculeaza(_ sender: UIButton)
    {
        if cateta1.text != "" && cateta2.text != ""
        {
        c1String = cateta1.text!
        c2String = cateta2.text!
        ipStr = String(ip)
        if ipStr.count <= 4
        {
            c1 = Double(cateta1.text!)!
            c2 = Double(cateta2.text!)!
            ip = (Int(c1 * c1 + c2 * c2))
                scoatereDeSubRadical()
            // salvam variabilele de tip double in alte variabile de tip int ca sa nu apara (ex: 5.0) si sa apara doar (ex: 5)
            afara = Int(pAfara)
            sub = Int(pSub)
            iint = Int(sqrt(Double(i)))
                if pAfara != 1 // verificam daca numarul este patrat perfect
                {
                    if pSub != 1
                    {
                        label.text = "a = " + String(afara) + "√" + String(sub) + " = " + String(sqrt(Double(i)))
                    }
                    else if pSub == 1
                    {
                        label.text = "a = " + String(iint)
                    }
                }
                else if pAfara == 1
                {
                    label.text = "a = √" + String(sub) + " = " + String(sqrt(Double(i)))

                }
            }
        }
        else if cateta1.text != "" && cateta2.text == ""
        {
            label.text = "Scrie valoarea lui c."
        }
        else if cateta1.text == "" && cateta2.text != ""
        {
            label.text = "Scrie valoarea lui b."
        }
        else if cateta1.text == "" && cateta2.text == ""
        {
            label.text = "Scrie valorile catetelor."
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.cateta1.delegate = self
        self.cateta2.delegate = self
        
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
        cateta1.resignFirstResponder()
        cateta2.resignFirstResponder()
        return true
    }

    override var prefersStatusBarHidden: Bool
    {
        return false
    }
    
}
