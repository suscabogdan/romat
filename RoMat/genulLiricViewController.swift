//
//  genulLiricViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 03/08/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

var titluLiric = ""
var autorLiric = ""
var ipostazaLiric = ""
var sentimenteLiric = ""
var temaLiric = ""
var partiDeVorbireLiric = ""
var simbolTitluLiric = ""
var figuriDeStilLiric = ""
var imaginiArtisticeLiric = ""
var rimaLiric = ""
var masuraLiric = ""
var ritmLiric = ""

class genulLiricViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titluTextField: UITextField!
    @IBOutlet weak var autorTextField: UITextField!
    @IBOutlet weak var ipostazaTextField: UITextField!
    @IBOutlet weak var sentimenteTextField: UITextField!
    @IBOutlet weak var temaTextField: UITextField!
    @IBOutlet weak var partiDeVorbireTextField: UITextField!
    @IBOutlet weak var simbolTitluTextField: UITextField!
    @IBOutlet weak var figuriDeStilTextField: UITextField!
    @IBOutlet weak var imaginiArtisticeTextField: UITextField!
    @IBOutlet weak var rimaTextField: UITextField!
    @IBOutlet weak var masuraTextField: UITextField!
    @IBOutlet weak var ritmTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func argumenteaza(_ sender: Any) {
        if titluTextField.text != "" && autorTextField.text != "" && ipostazaTextField.text != "" && sentimenteTextField.text != "" && temaTextField.text != "" && partiDeVorbireTextField.text != "" && simbolTitluTextField.text != "" && figuriDeStilTextField.text != "" && imaginiArtisticeTextField.text != "" && rimaTextField.text != "" && masuraTextField.text != "" && ritmTextField.text != ""
        {
            label.text = ""
            titluLiric = titluTextField.text!
            autorLiric = autorTextField.text!
            ipostazaLiric = ipostazaTextField.text!
            sentimenteLiric = sentimenteTextField.text!
            temaLiric = temaTextField.text!
            partiDeVorbireLiric = partiDeVorbireTextField.text!
            simbolTitluLiric = simbolTitluTextField.text!
            figuriDeStilLiric = figuriDeStilTextField.text!
            imaginiArtisticeLiric = imaginiArtisticeTextField.text!
            rimaLiric = rimaTextField.text!
            masuraLiric = masuraTextField.text!
            ritmLiric = ritmTextField.text!
            performSegue(withIdentifier: "segueLiric", sender: self)
        }
        else
        {
            label.text = "Nu ai completat toate campurile!"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
}
