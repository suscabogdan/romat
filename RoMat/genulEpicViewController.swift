//
//  genulEpicViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 05/09/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

var titluEpic = ""
var autorEpic = ""
var persoanaEpic = ""
var naratorEpic = ""
var personajeEpic = ""
var rezumatEpic = ""
var indiciTimpEpic = ""
var indiciSpatiuEpic = ""

class genulEpicViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var titluTextField: UITextField!
    @IBOutlet weak var autorTextField: UITextField!
    @IBOutlet weak var persoanaTextField: UITextField!
    @IBOutlet weak var naratorTextField: UITextField!
    
    @IBOutlet weak var personajeTextView: UITextView!
    @IBOutlet weak var rezumatTextView: UITextView!
    
    @IBOutlet weak var indiciTimpTextField: UITextField!
    @IBOutlet weak var indiciSpatiuTextField: UITextField!
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personajeTextView.layer.borderWidth = 0.5
        personajeTextView.layer.cornerRadius = 5
        personajeTextView.text = "ex: personajele principale: Ionel, doamna Popescu și naratorul Ion Luca Caragiale și personajul secundar: menajera"
        
        rezumatTextView.layer.borderWidth = 0.5
        rezumatTextView.layer.cornerRadius = 5
    }
    
    @IBAction func argumentare(_ sender: UIButton) {
        if titluTextField.text != "" && autorTextField.text != "" && persoanaTextField.text != "" && naratorTextField.text != "" && personajeTextView.text != "" && rezumatTextView.text != "" && indiciTimpTextField.text != "" && indiciSpatiuTextField.text != "" {
            label.text = ""
            titluEpic = titluTextField.text!
            autorEpic = autorTextField.text!
            persoanaEpic = persoanaTextField.text!
            naratorEpic = naratorTextField.text!
            personajeEpic = personajeTextView.text!
            rezumatEpic = rezumatTextView.text!
            indiciTimpEpic = indiciTimpTextField.text!
            indiciSpatiuEpic = indiciSpatiuTextField.text!
            performSegue(withIdentifier: "segueEpic", sender: self)
        }
        else {
            label.text = "Nu ai completat toate câmpurile!"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return false
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n"
        {
            personajeTextView.resignFirstResponder()
            rezumatTextView.resignFirstResponder()
            return false
        }
        return true
    }
    
}
