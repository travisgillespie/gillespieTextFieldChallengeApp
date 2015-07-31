//
//  ZipCodeDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Travis Gillespie on 7/29/15.
//  Copyright (c) 2015 Travis Gillespie. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeDelegate : NSObject, UITextFieldDelegate {
    
    //use colorizer to alllow editing of diff text
    //use colorizer to allow return key to hide keyboard

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        println("allow editing")
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        println("user is eding")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        println("editing is done")
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("enter was pressed")
        return true
    }
    
    //monitors what users are entering
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        //only allow numbers to be entered
        // Create an `NSCharacterSet` set which includes everything *but* the digits
        let inverseSet = NSCharacterSet(charactersInString:"0123456789").invertedSet
        
        // At every character in this "inverseSet" contained in the string,
        // split the string up into components which exclude the characters
        // in this inverse set
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        
        // Rejoin these components
        let filtered = join("", components)
        
        //limit number of characters to 5
        var length = (count(textField.text) + count(string))
        if(length > 5){
            return false
        } else {
            
            // If the original string is equal to the filtered string, i.e. if no
            // inverse characters were present to be eliminated, the input is valid
            // and the statement returns true; else it returns false
            return string == filtered
        }
        
        
    }
 
    func textFieldShouldClear(textField: UITextField) -> Bool {
        println("clear button hit")
        return true
    }

}