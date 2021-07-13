//
//  ViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 31/01/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

var quizBool:Bool = false

class ViewController: UIViewController {
    
    @IBOutlet weak var teorie: UITextView!
    
    @IBAction func test(_ sender: Any) {
        quizBool = true
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        quizBool = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if checkIfRoMatIdPaid == true
        {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationItem.title = subiect[myIndex]
            teorie.text = subiectDesc[myIndex]
            if navigationItem.title == "Prezentarea unui personaj"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
            }
            if navigationItem.title == "Titlul unei opere literare"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
            }
            if navigationItem.title == "Opinia personala asupra unui text"
            {
                navigationController?.navigationBar.prefersLargeTitles = false
            }
        }
        else
        {
            navigationController?.navigationBar.prefersLargeTitles = true
            if myIndex <= 2
            {
                navigationItem.title = subiect[myIndex]
                teorie.text = subiectDesc[myIndex]
                if navigationItem.title == "Prezentarea unui personaj"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                if navigationItem.title == "Titlul unei opere literare"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                if navigationItem.title == "Opinia personala asupra unui text"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
            }
            else
            {
                navigationItem.title = subiect[myIndex]
                teorie.text = "Aceasta este o versiune gratuita a aplicatiei. Deblocheaza toata aplicatia pentru numai 9,99 lei!"
                if navigationItem.title == "Prezentarea unui personaj"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                if navigationItem.title == "Titlul unei opere literare"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
                if navigationItem.title == "Opinia personala asupra unui text"
                {
                    navigationController?.navigationBar.prefersLargeTitles = false
                }
            }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if multimeInvatataLiteratura[myIndex] == 2
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.yellow
        }
        if multimeInvatataLiteratura[myIndex] == 3
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.green
        }
        if multimeInvatataLiteratura[myIndex] == 1
        {
            self.navigationController?.navigationBar.barTintColor = UIColor.white
        }
        
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: subiect[myIndex]) != nil
        {
            let culoare = salveazaCuloare.value(forKey: subiect[myIndex]) as! NSInteger
            if culoare == 2
            {
                self.navigationController?.navigationBar.barTintColor = UIColor.yellow
            }
            if culoare == 3
            {
                self.navigationController?.navigationBar.barTintColor = UIColor.green
            }
            if culoare == 1
            {
                self.navigationController?.navigationBar.barTintColor = UIColor.white
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
