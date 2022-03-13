//
//  ContactsViewController.swift
//  FindNumber
//
//  Created by macuser on 3/13/22.
//

import UIKit

class ContactsViewController: UIViewController {

    var contacts:[Contact] = [Contact(contactName: "Boris", contactNumber: "+79501535769")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // first way to communicate to the next ViewController
    // action in AddContactViewController should lead to the appropriate function
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    if(segue.identifier == "newContactVC"){
    //        if let navVC = segue.destination as? AddContactViewController{
    //            navVC.delegate = self
    //        }
    //    }
    //}
    
    // second way
    // don't forget to remove action from 'Save' button and drag and drop that button onto
    // exit icon and select: actionSegue -> unwindToContacts
    @IBAction func unwindToContacts(_ unwindSegue: UIStoryboardSegue) {
        if let sourceViewController = unwindSegue.source as? AddContactViewController{
            var newContact = Contact(contactName: sourceViewController.NameInputField.text!, contactNumber: sourceViewController.PhoneNumberInputField.text!)
            contacts.append(newContact)
            tableView.reloadData()
        }
        // Use data from the view controller which initiated the unwind segue
    }
}

extension ContactsViewController: UITableViewDataSource{
    
    // determines how many items there will be
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        return contacts.count
    }
    
    // is for filling each item of tableView with data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = "\(contacts[indexPath.row].contactName)"
        cell.detailTextLabel?.text = "\(contacts[indexPath.row].contactNumber)"
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

protocol ContactsDelegate:NSObject{
    func addNew(_ contact:Contact)
}

extension ContactsViewController:ContactsDelegate{
    func addNew(_ contact: Contact) {
        dismiss(animated: true) { [weak self] in
            self?.contacts.append(contact)
            self?.tableView.reloadData()
        }
    }
}
