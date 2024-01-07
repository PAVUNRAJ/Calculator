//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypeNumber =  true
    var calculatorLagic = CalculatorLogic()
    
    private var displayValue: Double {
        
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Empty display label")
            }
            return number
        }
        
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTypeNumber = true

        calculatorLagic.number = Double(displayValue)
        //What should happen when a non-number button is pressed
        if let callMethod = sender.currentTitle {
            if let result = calculatorLagic.calculateSymbol(callMethod) {
                displayValue = result
            }
        }
        print("Hi")
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let newValue =  sender.currentTitle {
            if isFinishedTypeNumber {
                isFinishedTypeNumber = false
                displayLabel.text = newValue
            } else {
                
                displayLabel.text! += newValue
            }
        }
       
    
    }

}

