//
//  medieDe10ViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 14/11/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//
/*
import UIKit

class medieDe10ViewController: UIViewController {

    var numar10:Int = 0
    var medie:Double
    var verificaTeza:Bool = false
    var numarNote:Int = 0
    var medieNoua:Double
    var notaTeza: Int
    
    func catiDe10(medieNoua: Double, numarNote: Int, verificaTez: Bool) -> Int {
        // Verificam daca medie este cu teza
        if verificaTeza == false
        {
            // Calculam media fara sa fie impartita la numarul de note
            medie = medie * Double(numarNote)
            while medie < medieNoua - 0.5
            {
                numar10 = numar10 + 1
                medie = (medie + 10) / Double((numar10 + numarNote))
            }
            return numar10;
        }
        else if verificaTeza == true
        {
            medie = (((medie * 4) - Double(notaTeza)) * Double(numarNote)) / 3
            while medie < medieNoua - 0.5
            {
                numar10 = numar10 + 1
                medie = (medie / Double(numarNote) * 3 + Double(notaTeza)) / 4
                if medie < medieNoua - 0.5
                {
                    medie = (((medie * 4) - Double(notaTeza)) * (Double(numarNote) + Double(numar10))) / 3
                }
            }
            return numar10;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
*/
