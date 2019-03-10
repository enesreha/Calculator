//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
   
    private var displayValue: Double{
        get{
            guard let number = Double(displayLabel.text!) else {fatalError("Cannot convert display label text to a Double")}
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle{
            let calculator = CalculatorLogic(number: displayValue)
            
            guard let result = calculator.calculate(symbol: calcMethod) else{
                fatalError("The result of the calculation is nil")
            }
            displayValue = result
        }
        
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        //The identity of the button that was tapped is stored in the sender object. Sender has whole bunch of properties like background color, size of the button etc. These buttons (numbers) already has a text in them so I need to figure out to get the text on the button that get triggered.
     
        if let numValue = sender.currentTitle{
            if isFinishedTypingNumber{
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            }else{
                if numValue == "."{
                    
                let isInt = floor(displayValue) == displayValue
                    //this code says that round down the currentDisplayValue (if it's 8.1 round down to 8) and compare the rounded down version currentDisplayValue to the normal currentDisplayValue. It it's not equal isInt becomes false.
                    if !isInt{ //if isInt is false i.e. we don't have an integer
                        return //return here forces our function to return. And it means we don't continue appending the current numValue (which here it is "." ) to the display.
                    }
                    
                    
                }
                displayLabel.text = displayLabel.text! + numValue
            }
           
        }
        
    
    }

}

