//
//  ciornaViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 12/07/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit
import CoreData

class ciornaViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var titluCompunereTextField: UITextField!
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func numarCuvinte(_ sender: Any) {
        let words = textView.text.components(separatedBy: .whitespacesAndNewlines)
        let filteredWords = words.filter({ (word) -> Bool in
            word != ""
        })
        let wordCount = filteredWords.count
        
        if wordCount == 1
        {
            navigationItem.title = "1 cuvant"
        } else if wordCount > 1 || wordCount == 0
            {
                navigationItem.title = String(wordCount) + " cuvinte"
            }
    }
    
    @IBAction func sterge(_ sender: Any) {
        createAlert(title: "Atentie!", message: "Vrei sa stergi compunerea si sa o iei de la inceput?")
    }
    
    @IBAction func tastatura(_ sender: Any) {
        textView.resignFirstResponder()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createAlert(title: String, message: String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "Da", style: UIAlertActionStyle.default, handler:{ (action) in
            self.textView.text = ""
        }))
        alert.addAction(UIAlertAction(title: "Nu", style: UIAlertActionStyle.default, handler:{ (action) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
