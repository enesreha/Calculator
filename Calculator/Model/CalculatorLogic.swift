//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Enes Reha GILBAZ on 3/9/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
//UIKit has everything that Foundation has but also it has UI related codes like UILabel etc.
//When we're gonna subclass something like UIViewController etc we use Cocoa Touch Class but if we're gonna create our own custom classes we're gonna use swift file.
struct CalculatorLogic{
    private var number: Double?
    private var intermediateCalculation: (n1: Double, calcMethod: String)?
    
    //We don't need an initializer because we're in a struct
    
   mutating func setNumber (_ number: Double){
        self.number = number
    }
  
   mutating func calculate (symbol: String) -> Double?{
    
        if let n = number{
            
        switch symbol{
        case "+/-":
            return n * -1
        case "AC":
            return 0
        case "%":
           return n * 0.01
        case "=":
            return performTwoNumCalculation(n2: n)
        default:
            intermediateCalculation = (n1: n, calcMethod: symbol)
            }
            }
     return nil
        
}
    private func performTwoNumCalculation(n2: Double) -> Double?{
        
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.calcMethod{

            switch operation{
            case "+" :
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operatin passed in does not match any of the cases.")
            }
        }
      
       return nil
    }
}
