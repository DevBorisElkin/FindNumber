//
//  BlueViewController.swift
//  FindNumber
//
//  Created by macuser on 3/10/22.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func OpenGreenScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var controller = storyboard.instantiateViewController(withIdentifier: "GreenScreen")
        controller.title = "Green"
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
