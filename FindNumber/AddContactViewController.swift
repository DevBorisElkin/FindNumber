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

        NameInputField.delegate = self
        PhoneNumberInputField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        PhoneNumberInputField.resignFirstResponder()
    }
    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        print("SaveButtonClicked. name:\(NameInputField.text), phone number:\(PhoneNumberInputField.text)")
    }
    
}

extension AddContactViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
