//
//  SettingsTableViewController.swift
//  FindNumber
//
//  Created by macuser on 3/12/22.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var switchTimer: UISwitch!
    @IBOutlet weak var timeGamelabel: UILabel!
    
    @IBAction func changeTimerState(_ sender: UISwitch) {
        Settings.shared.currentSettings.timerState = sender.isOn
    }
    
    @IBAction func RestoreToDefaultSettings(_ sender: Any) {
        Settings.shared.currentSettings = Settings.shared.defaultSettings
        loadSettings()
    }
    
    func loadSettings(){
        timeGamelabel.text = "\(Settings.shared.currentSettings.timeForGame) sec"
        switchTimer.isOn = Settings.shared.currentSettings.timerState
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSettings()
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
