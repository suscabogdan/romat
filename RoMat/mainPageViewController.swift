//
//  mainPageViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 02/05/2019.
//  Copyright © 2019 Susca Bogdan. All rights reserved.
//

import UIKit

class mainPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        inregistrareFalse() // acum de fiecare data cand suntem pe prima pagina inseamna ca nu suntem logati deci vom selecta inregistrare falsa
    }
    
    func verificaInregistrareNula() -> Bool
    {
        let verificare = UserDefaults.standard
        if verificare.value(forKey: "verificareLogare") != nil
        {
            return false
        }
        else
        {
            return true
        }
    }
    func inregistrareFalse()
    {
        let verificare = UserDefaults.standard
        verificare.setValue(false, forKey: "verificareLogare")
    }
    
    func inregistrareTrue()
    {
        let verificare = UserDefaults.standard
        verificare.setValue(true, forKey: "verificareLogare")
    }
}
