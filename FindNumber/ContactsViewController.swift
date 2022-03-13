//
//  ContactsViewController.swift
//  FindNumber
//
//  Created by macuser on 3/13/22.
//

import UIKit

class ContactsViewController: UIViewController {

    var defaultContact:Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
        defaultContact = Contact(contactName: "Boris", contactNumber: "+79501535769")
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
}

extension ContactsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = "\(defaultContact!.contactName)"
        cell.detailTextLabel?.text = "\(defaultContact!.contactNumber)"
        return cell
    }
    
}

class Contact{
    var contactName:String = ""
    var contactNumber:String = ""
    
    init(contactName:String, contactNumber:String){
        self.contactName = contactName
        self.contactNumber = contactNumber
    }
}
