//
//  quizQuestionsViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 27/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit



class quizQuestionsViewController: UIViewController {
    
    @IBOutlet weak var intrebare: UILabel!
    @IBOutlet weak var puncte: UILabel!
    
    @IBOutlet weak var raspuns1: UIButton!
    @IBOutlet weak var raspuns2: UIButton!
    @IBOutlet weak var raspuns3: UIButton!
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var intre = 1
    var p = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreController = segue.destination as! quizScoreViewController
        scoreController.scor = p
    }
    
    @IBOutlet weak var lbl: UILabel!
    @IBAction func action(_ sender: Any)
    {
        if (sender as AnyObject).tag == Int(rightAnswerPlacement)
        {
            if currentQuestion == questions.count
            {
                p = p + 1
                puncte.text = "Puncte: " + String(p)
                performSegue(withIdentifier: "quizSegue", sender: self)
            }
            else
            {
                p = p + 1
                newQuestion()
                puncte.text = "Puncte: " + String(p)
                intrebare.text = "Intrebare: " + String(currentQuestion)
            }
        }
        else if currentQuestion != questions.count
        {
            newQuestion()
            intrebare.text = "Intrebare: " + String(currentQuestion)
        }
        else
        {
            performSegue(withIdentifier: "quizSegue", sender: self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if quizBool == true
        {
            newQuestion()
        }
        else if quizBool == false
        {
            navigationController!.popViewController(animated: true)
        }
    }

    func newQuestion()
    {
        lbl.text = questions[currentQuestion]
        rightAnswerPlacement = arc4random_uniform(3) + 1
        var button:UIButton = UIButton()
        var x = 1
        for i in 1...3
        {
            button = view.viewWithTag(i) as! UIButton
            if i == Int(rightAnswerPlacement)
            {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if quizBool == false
        {
            navigationController!.popViewController(animated: true)
        }
        raspuns1.titleLabel?.textAlignment = NSTextAlignment.center
        raspuns2.titleLabel?.textAlignment = NSTextAlignment.center
        raspuns3.titleLabel?.textAlignment = NSTextAlignment.center
        copiereDeMultime()
    }
    
    func copiereDeMultime()
    {
        if myIndex == 0
        {
            questions = intrebariLiric
            answers = raspunsuriLiric
        }
        else if myIndex == 1
        {
            questions = intrebariPastel
            answers = raspunsuriPastel
        }
        else if myIndex == 2
        {
            questions = intrebariDoinaPopulara
            answers = raspunsuriDoinaPopulara
        }
        else if myIndex == 3
        {
            questions = intrebariGenulEpic
            answers = raspunsuriGenulEpic
        }
        else if myIndex == 4
        {
            questions = intrebariSchita
            answers = raspunsuriSchita
        }
        else if myIndex == 5
        {
            questions = intrebariNuvela
            answers = raspunsuriNuvela
        }
        else if myIndex == 6
        {
            questions = intrebariBasmulPopular
            answers = raspunsuriBasmulPopular
        }
        else if myIndex == 7
        {
            questions = intrebariFabula
            answers = raspunsuriFabula
        }
        else if myIndex == 8
        {
            questions = intrebariBaladaPopulara
            answers = raspunsuriBaladaPopulara
        }
        else if myIndex == 9
        {
            questions = intrebariRomanul
            answers = raspunsuriRomanul
        }
        else if myIndex == 10
        {
            questions = intrebariGenulDramatic
            answers = raspunsuriGenulDramatic
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }

}
