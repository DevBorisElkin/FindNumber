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
        print("YellowViewController -> viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("YellowViewController -> viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("YellowViewController -> viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("YellowViewController -> viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("YellowViewController -> viewDidDisappear")
    }
    // deinit вызывается тогда когда уничтожается экземпляр класса и на него нету strong ссылок
    deinit{
        print("YellowViewController -> deinit")
    }
    
    // -*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*

    @IBAction func OpenBlueScreen(_ sender: Any) {
        performSegue(withIdentifier: "goToBlue", sender: "Message transfered")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier{
        case "goToBlue":
            if let blueVC = segue.destination as? BlueViewController{
                if let message = sender as? String{
                    blueVC.transferedDataText  = message
                }
            }
        default:
            break
        }
    }
}
