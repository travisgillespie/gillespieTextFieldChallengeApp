//
//  ViewController.swift
//  TextFieldChallengeApp
//
//  Created by Travis Gillespie on 7/29/15.
//  Copyright (c) 2015 Travis Gillespie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    
    //outlets
    @IBOutlet weak var textFieldZipCode: UITextField!
    @IBOutlet weak var textFieldDollarAmount: UITextField!
    @IBOutlet weak var textFieldFreeResponse: UITextField!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    //text field delegate objects
    let zipCodeDelegate = ZipCodeDelegate()
    let dollarAmountDelegate = DollarAmountDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.textFieldZipCode.delegate = zipCodeDelegate
        self.textFieldDollarAmount.delegate = dollarAmountDelegate
        self.textFieldFreeResponse.delegate = self
        self.toggleSwitch.setOn(true, animated: false)
    }

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        println("toggle is on")
        return self.toggleSwitch.on
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println("enter was pressed")
        self.textFieldFreeResponse.resignFirstResponder()
        return true
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        println("user pressed clear")
        return true
    }
    
    @IBAction func toggleSwitch(sender: AnyObject) {
        if (sender as! UISwitch).on {
            //use this section to enable editing
            self.textFieldFreeResponse.placeholder = "Disable editing: flip switch ->"

        } else if !(sender as! UISwitch).on {
            //use this section to disable editing
            self.textFieldFreeResponse.placeholder = "Enable editing: flip switch ->"
            self.textFieldFreeResponse.resignFirstResponder()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

