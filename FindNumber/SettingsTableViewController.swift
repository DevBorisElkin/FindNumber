//
//  SettingsTableViewController.swift
//  FindNumber
//
//  Created by macuser on 3/12/22.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "selectTimeVC":
            if let vc = segue.destination as? SelectTimeViewController{
                vc.data = [10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75]
            }
        default:
            
            break
        }
    }

}
