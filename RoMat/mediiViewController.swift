//
//  mediiViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 29/03/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class mediiViewController: UIViewController, UITextFieldDelegate {
    
    var a = 0
    var b = 0
    var medieDoub:Double = 0
    var medieIn:Int = 0
    var p:Double = 0
    var i = 0
    var d:Double = 0
    var nr = 0
    var pAfara:Double = 0
    var pSub:Double = 0
    
    @IBOutlet weak var numarA: UITextField!
    @IBOutlet weak var numarB: UITextField!
    @IBAction func Calculeaza(_ sender: Any) {
        if numarA.text != "" && numarB.text != ""
        {
            label.text = ""
            calculeazaMedieAritmetica()
            label.text = label.text! + "\n"
            calculeazaMediaGeo()
            label.text = label.text! + "\n"
            calculeazaPatratica()
            label.text = label.text! + "\n"
            calculeazaArmonica()
        }
        else if numarA.text == "" && numarB.text != ""
        {
            label.text = "Scrie numarul a."
        }
        else if numarA.text != "" && numarB.text == ""
        {
            label.text = "Scrie numarul b."
        }
        else if numarA.text == "" && numarB.text == ""
        {
            label.text = "Scrie numerele a si b."
        }
    }
    @IBOutlet weak var label: UILabel!
    func scoatereDeSubRadical() {
        pAfara = 1
        pSub = 1
        d = 2
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
    // MEDIA GEOMETRICA
    
    func calculeazaMediaGeo()
    {
        if numarA.text != "" && numarB.text != ""
        {
            a = Int(numarA.text!)!
            b = Int(numarB.text!)!
            if String(a).count <= 9 && String(b).count <= 9
            {
                medieGeometrica()
            }
            else if String(a).count <= 9 && String(b).count > 9
            {
                label.text = "b este prea mare."
            }
            else if String(a).count > 9 && String(b).count <= 9
            {
                label.text = "a este prea mare."

            }
            else if String(a).count > 9 && String(b).count > 9
            {
                label.text = "a si b sunt prea mari."
            }
        }
    }
    func medieGeometrica() {
        p = Double(a * b)
        if a == b
        {
            label.text = label.text! + "\nmg = " + String(a)
        }
        else if a == 0 && b == 1 || a == 1 && b == 0
        {
            label.text = label.text! + "\nmg = 0"
        }
        else if a != b
        {
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

            scoatereDeSubRadical()
            if pAfara != 1
            {
                label.text = label.text! + "\nmg = " + String(pAfara) + "√" + String(pSub) + " = " + String(sqrt(Double(i)))
            }
            else if pAfara == 1
            {
                label.text = label.text! + "\nmg = √" + String(pSub) + " = " + String(sqrt(Double(i)))
            }
        }
    }
    
    // MEDIA ARMONICA
    
    func calculeazaArmonica() {
        if numarA.text != "" && numarB.text != ""
        {
            a = Int(numarA.text!)!
            b = Int(numarB.text!)!
            if String(a).count <= 9 && String(b).count <= 9
            {
                medieArmonica()
            }
            else if String(a).count <= 9 && String(b).count > 9
            {
                label.text = "b este prea mare."
            }
            else if String(a).count > 9 && String(b).count <= 9
            {
                label.text = "a este prea mare."
            }
            else if String(a).count > 9 && String(b).count > 9
            {
                label.text = "a si b sunt prea mari."
            }
        }
    }
    func medieArmonica() {
        if a != 0 && b != 0
        {
            medieIn = (2 * a * b) / (a + b)
            label.text = label.text! + "\nmh = " + String(medieIn)
        }
        else if a == 0 && b == 0
        {
            label.text = label.text! + "\na + b = 0 => nu se poate realiza impartirea la 0."
        }
    }
    
    // MEDIA PATRATICA
    
    func calculeazaPatratica() {
        if numarA.text != "" && numarB.text != ""
        {
            a = Int(numarA.text!)!
            b = Int(numarB.text!)!
            if String(a).count <= 9 && String(b).count <= 9
            {
                mediePatratica()
            }
            else if String(a).count <= 9 && String(b).count > 9
            {
                label.text = "b este prea mare."
            }
            else if String(a).count > 9 && String(b).count <= 9
            {
                label.text = "a este prea mare."
            }
            else if String(a).count > 9 && String(b).count > 9
            {
                label.text = "a si b sunt prea mari."
            }
        }
}
    func mediePatratica() {
        if a == 0 && b == 0
        {
            label.text = label.text! + "\nmp = 0"
        }
        else
        {
            p = Double((a * a + b * b) / 2)
            if (a*a + b*b) % 2 == 0
            {
                scoatereDeSubRadical()
                if pAfara != 1
                {
                    label.text = label.text! + "\nmp = " + String(pAfara) + "√" + String(pSub) + " = " + String(sqrt(Double(i)))
                }
                else if pAfara == 1
                {
                    label.text = label.text! + "\nmp = √" + String(pSub) + " = " + String(sqrt(Double(i)))
                }
            }
            else if (a*a + b*b) % 2 != 0
            {
                label.text = label.text! + "\nmp = √" + String(Double((a*a + b*b) / 2)) + " = " + String(sqrt(p))
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    }
    
    // MEDIA ARITMETICA
    
    
    func medieAritmetica() {
        if a%2 == 0 && b%2 == 0 || a%2 != 0 && b%2 != 0
        {
            medieIn = (a + b) / 2
            label.text = label.text! + "\nma = " + String(medieIn)
        }
        else
        {
            medieDoub = Double((a + b) / 2)
            label.text = label.text! + "\nma = " + String(medieDoub + 0.5)
        }
    }
    
    func calculeazaMedieAritmetica() {
        if numarA.text != "" && numarB.text != ""
        {
            a = Int(numarA.text!)!
            b = Int(numarB.text!)!
            if String(a).count <= 9 && String(b).count <= 9
            {
                medieAritmetica()
            }
            else if String(a).count > 9 && String(b).count <= 9
            {
                label.text = "a este prea mare."
            }
            else if String(a).count <= 9 && String(b).count > 9
            {
                label.text = "b este prea mare."
            }
            else if String(a).count > 9 && String(b).count > 9
            {
                label.text = "a si b sunt prea mari."
            }
        }
    }
    
    
    @IBOutlet weak var labelFormule: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        labelFormule.text = "ma = (a + b) / 2\nmg = √(a + b)\nmp = √[ (a² + b²) / 2 ]\nmh = (2ab) / (a + b)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numarA.resignFirstResponder()
        numarB.resignFirstResponder()
        
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
