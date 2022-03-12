//
//  SelectTimeViewController.swift
//  FindNumber
//
//  Created by macuser on 3/12/22.
//

import UIKit

class SelectTimeViewController: UIViewController, UITableViewDelegate/*, UITableViewDataSource  we can do it like that, or second way - via extension */{

    var data:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self  // first way to set up data source
        
        tableView.reloadData() // при вызове перезапускает таблицу и методы 'протокола' DataSource вызываются еще раз
        
    }
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
           // tableView?.dataSource = self // second way to set up data source
            
            tableView?.delegate = self
        }
    }
    // third way - table view - right click long drag & drop onto
    // scuare view button, and select 'data source'
}

extension SelectTimeViewController: UITableViewDataSource{
    
    //func numberOfSections(in tableView: UITableView) -> Int {
    //    return 5 // by default = return 1
    //}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        cell.textLabel?.text = "\(data[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //UserDefaults.standard.setValue(data[indexPath.row], forKey: "timeForGame")
        
        // get data from UserDefaults
        //UserDefaults.standard.integer(forKey: "timeForGame") // standard empty = 0
        //UserDefaults.standard.float(forKey: "timeForGame") // standard empty = 0.0
        //UserDefaults.standard.object(forKey: "timeForGame") // standard empty = nil
        
        Settings.shared.currentSettings.timeForGame = data[indexPath.row]
        navigationController?.popViewController(animated: true)
        
        print(data[indexPath.row])
    }    
}
