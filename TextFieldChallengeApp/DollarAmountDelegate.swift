//
//  DollarAmountDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Travis Gillespie on 7/29/15.
//  Copyright (c) 2015 Travis Gillespie. All rights reserved.
//

import Foundation
import UIKit


var myIntArray = ["0","0","0"]
var i = 0

class DollarAmountDelegate : NSObject, UITextFieldDelegate {
  
    func textFieldDidBeginEditing(textField: UITextField) {
        if textField.text.isEmpty{
            textField.text = "$0.00"
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        i++
        println("\nROUND: \(i)")
        
        //only allow numbers to be entered
        // Create an `NSCharacterSet` set which includes everything *but* the digits
        let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
        
        // At every character in this "inverseSet" contained in the string,
        // split the string up into components which exclude the characters
        // in this inverse set
        let joiner = ""
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        let filtered = joiner.join(components)
        
        //check to see if string values entered by user are "0-9"
        if string == filtered {
            //removing and appending string values to an array
            if myIntArray[0] == "0" {
                myIntArray.removeAtIndex(0)
                myIntArray.append(string)
                println("myIntArray: \(myIntArray)")
            } else if myIntArray[0] != "0" {
                myIntArray.append(string)
                println("myIntArray: \(myIntArray)")
            }
        }
        
        var arrayLength = myIntArray.count
        var dollars = joiner.join(myIntArray[0...arrayLength-3])
        var pennies = joiner.join(myIntArray[arrayLength-2...arrayLength-1])
        println("dollars: \(dollars)")
        println("pennies: \(pennies)")
        
        //REFERENCE: http://stackoverflow.com/questions/27001914/swift-xcode-string-to-decimal-number
        var total : NSString = "\(dollars).\(pennies)"
        var newTotal : Double = total.doubleValue
        
        //REFERENCE: http://nshipster.com/nsformatter/
        //REFERENCE: https://www.bignerdranch.com/blog/playing-with-numbers-in-global-playgrounds/
        var numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        let newValue = numberFormatter.stringFromNumber(newTotal)!
        println("new value: \(newValue)")
        textField.text = newValue
        
        return false
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        println("clear button pressed")
        myIntArray.removeAll()
        println(myIntArray)
        myIntArray = ["0","0","0"]
        
        return true
    }
    
}