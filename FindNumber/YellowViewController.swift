//
//  YellowViewController.swift
//  FindNumber
//
//  Created by macuser on 3/10/22.
//

import UIKit

class YellowViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func OpenBlueScreen(_ sender: Any) {
        performSegue(withIdentifier: "goToBlue", sender: nil)
    }
}
