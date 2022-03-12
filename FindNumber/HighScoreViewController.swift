//
//  HighScoreViewController.swift
//  FindNumber
//
//  Created by macuser on 3/12/22.
//

import UIKit

class HighScoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let record = UserDefaults.standard.integer(forKey: KeysUserDefaults.recordGame)
        if(record != 0){
            recordlabel.text = "record: \(record)"
        }else{
            recordlabel.text = "no record yet"
        }
        
    }
    
    @IBOutlet weak var recordlabel: UILabel!
    
    @IBAction func CloseHighScore(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
