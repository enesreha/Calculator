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
class CalculatorLogic{
    var number: Double //it's not gonna have a value until we pass it over from ViewController. Because of that I don't wanna give a value to it, to be able to do that I have to initialize it when I create a new object from this class.
    init(number: Double) {
        self.number = number
    }
  
    func calculate (symbol: String) -> Double?{
        if symbol == "+/-" {
            return number * -1
        }
        else if symbol == "AC"{
            return 0
        }
        else if symbol == "%" {
           return number * 0.01
        }
     return nil
}
}
