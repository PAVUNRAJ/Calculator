//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by PavunRaj on 06/01/24.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
     var number: Double?
    
    var intermidiateCalculation : (n1: Double, calcMethod: String)?
    mutating func calculateSymbol(_ symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
               return performTwoNumCalculation(n2: n)
            default:
                intermidiateCalculation = (n1: n, calcMethod: symbol)

            }
        
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermidiateCalculation?.n1,
            let operation = intermidiateCalculation?.calcMethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases.")
            }
        }
        return nil
    }
}
