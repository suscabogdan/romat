//
//  CalculatorViewController.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 24/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

enum Operation:String
{
    case Add = "+"
    case Subtract = "-"
    case Divide = "/"
    case Multipply = "*"
    case NULL = "Null"
}

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var outputLbl: UILabel!
    
    var c = 0
    var runningNumber = ""
    var leftValue = ""
    var rightValue = ""
    var result = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outputLbl.text = ""
    }
    
    @IBAction func numberPressed(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
                runningNumber += "\(sender.tag)"
                outputLbl.text = runningNumber
        }
    }
    @IBAction func allClearPressed(_ sender: RoundButton) {
        c = 0
        runningNumber = ""
        leftValue = ""
        rightValue = ""
        result = ""
        currentOperation = .NULL
        outputLbl.text = ""
    }
    @IBAction func dotPressed(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
            if runningNumber != ""
            {
                c = c + 1
                if c == 1
                {
                    runningNumber += "."
                    outputLbl.text = runningNumber
                }
            }
        }
    }
    @IBAction func equalPressed(_ sender: RoundButton) {
        operation(operation: currentOperation)
    }
    @IBAction func addPressed(_ sender: RoundButton) {
        operation(operation: .Add)
    }
    @IBAction func subtractPressed(_ sender: RoundButton) {
        operation(operation: .Subtract)
    }
    @IBAction func multiplyPressed(_ sender: RoundButton) {
        operation(operation: .Multipply)
    }
    @IBAction func dividePressed(_ sender: RoundButton) {
        operation(operation: .Divide)
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
            if runningNumber != "" {
                rightValue = runningNumber
                runningNumber = ""
                
                if currentOperation == .Add {
                    result = "\(Double(leftValue)! + Double(rightValue)!)"
                }else if currentOperation == .Subtract {
                    result = "\(Double(leftValue)! - Double(rightValue)!)"
                }else if currentOperation == .Multipply {
                    result = "\(Double(leftValue)! * Double(rightValue)!)"
                }else if currentOperation == .Divide {
                    result = "\(Double(leftValue)! / Double(rightValue)!)"
                }
                leftValue = result
                if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0) {
                    result = "\(Int(Double(result)!))"
                }
                outputLbl.text = result
            }
            currentOperation = operation
            
        }else {
            leftValue = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }

    override var prefersStatusBarHidden: Bool {
        return false
    }
    
}
