//
//  quizScoreViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 19/07/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

class quizScoreViewController: UIViewController {

    var scor = 0
    var numarDeIntrebari = 0
    var procentInvatare = 0
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    func backButton()
    {
    self.navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(returnToStart))
        quizBool = false
    }
    
    @objc func returnToStart()
    {
        navigationController!.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        verificareNumarDeIntrebari()
        procentInvatare = (scor * 100) / numarDeIntrebari
        label2.text = "Ai invatat " + String(procentInvatare) + "% din lectie."
        let salveazaCuloare = UserDefaults.standard
        if salveazaCuloare.value(forKey: subiect[myIndex]) != nil
        {
            let culoare = salveazaCuloare.value(forKey: subiect[myIndex]) as! NSInteger
            if procentInvatare == 0
            {
                if culoare == 1
                {
                    multimeInvatataLiteratura[myIndex] = 1
                }
            }
            else if procentInvatare > 0 && procentInvatare < 100
            {
                if culoare == 1
                {
                    multimeInvatataLiteratura[myIndex] = 2
                }
                if culoare == 2
                {
                    multimeInvatataLiteratura[myIndex] = 2
                }
            }
            else if procentInvatare == 100
            {
                if culoare == 1
                {
                    multimeInvatataLiteratura[myIndex] = 3
                }
                if culoare == 2
                {
                    multimeInvatataLiteratura[myIndex] = 3
                }
                if culoare == 3
                {
                    multimeInvatataLiteratura[myIndex] = 3
                }
            }
            
        }
        saveProgress()
        quizBool = false
        backButton()
        label.text = String(scor) + "/" + String(numarDeIntrebari)
    }
    
    func verificareNumarDeIntrebari()
    {
        if myIndex == 0
        {
            numarDeIntrebari = numberOfQuestionsGramatica
        }
        else if myIndex == 1
        {
            numarDeIntrebari = numarIntrebariPastel
        }
        else if myIndex == 2
        {
            numarDeIntrebari = numarDeIntrebariDoinaPopulara
        }
        else if myIndex == 3
        {
            numarDeIntrebari = numarDeIntrebariGenulEpic
        }
        else if myIndex == 4
        {
            numarDeIntrebari = numarDeIntrebariSchita
        }
        else if myIndex == 5
        {
            numarDeIntrebari = numarDeIntrebariNuvela
        }
        else if myIndex == 6
        {
            numarDeIntrebari = numarDeIntrebariBasmulPopular
        }
        else if myIndex == 7
        {
            numarDeIntrebari = numarDeIntrebariFabula
        }
        else if myIndex == 8
        {
            numarDeIntrebari = numarDeIntrebariBaladaPopulara
        }
        else if myIndex == 9
        {
            numarDeIntrebari = numarDeIntrebariRomanul
        }
        else if myIndex == 10
        {
            numarDeIntrebari = numarDeIntrebariGenulDramatic
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func saveProgress()
    {
        let salveazaCuloare = UserDefaults.standard
        if multimeInvatataLiteratura[myIndex] == 2
        {
            salveazaCuloare.setValue(2, forKey: subiect[myIndex])
        }
        if multimeInvatataLiteratura[myIndex] == 3
        {
            salveazaCuloare.setValue(3, forKey: subiect[myIndex])
        }
        if multimeInvatataLiteratura[myIndex] == 1
        {
            salveazaCuloare.setValue(1, forKey: subiect[myIndex])
        }
    }
    
}
