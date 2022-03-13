//
//  AddContactViewController.swift
//  FindNumber
//
//  Created by macuser on 3/13/22.
//

import UIKit

class AddContactViewController: UIViewController {

    
    @IBOutlet weak var NameInputField: UITextField!
    
    @IBOutlet weak var PhoneNumberInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1)
        // for clicking 'return' to hide the keyboard
        NameInputField.delegate = self
        PhoneNumberInputField.delegate = self
    }
    
    // 2)
    // allows app to hide keyboard when a field was on
    // focus and user clicked off from keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        PhoneNumberInputField.resignFirstResponder()
        NameInputField.resignFirstResponder()
    }
    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        print("SaveButtonClicked. name:\(NameInputField.text), phone number:\(PhoneNumberInputField.text)")
    }
    
}

// 1)
extension AddContactViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// Note:
// 1), 2) are used for user to be able to click of
// keyboard for it bo be hidden or to press 'return'
// to be hidden
