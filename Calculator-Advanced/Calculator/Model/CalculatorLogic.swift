//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by 엄태양 on 2022/07/14.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalcultaion: (n1: Double, calcMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }

    mutating func calculate(symbol: String) -> Double? {
        
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0.0
            case "%":
                return n / 100.0
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
               intermediateCalcultaion = (n1: n, calcMethod: symbol)
            }
        }
                
        return nil
        
    }
    
    private func performTwoNumCalculation(n2: Double) -> Double? {
        
        if let n1 = intermediateCalcultaion?.n1,
            let operation = intermediateCalcultaion?.calcMethod {
            
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
