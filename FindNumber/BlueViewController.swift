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

        TransferedDataLabel.text = transferedDataText
    }
    
    @IBAction func OpenGreenScreen(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if var controller = storyboard.instantiateViewController(withIdentifier: "GreenScreen") as? GreenViewController{
            controller.textForLabel = "Wow message transfered!"
            
            controller.title = "Green"
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    var transferedDataText:String = ""
    
    @IBOutlet weak var TransferedDataLabel: UILabel!
    
}
