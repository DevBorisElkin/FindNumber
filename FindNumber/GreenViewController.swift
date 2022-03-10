//
//  GreenViewController.swift
//  FindNumber
//
//  Created by macuser on 3/10/22.
//

import UIKit

class GreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func GoToRoot(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func ToYellowMenu(_ sender: Any) {
        if let viewControllers = self.navigationController?.viewControllers{
            for vc in viewControllers{
                if vc is YellowViewController{
                    self.navigationController?.popToViewController(vc, animated: true)
                }
            }
        }
    }
}
