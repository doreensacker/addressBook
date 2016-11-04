//
//  AddFriendViewController.swift
//  Ue5-Otten-Sacker
//
//  Created by Doreen on 09.01.16.
//  Copyright © 2016 Doreen. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    @IBOutlet weak var nachnameField: UITextField!
    
    @IBOutlet weak var foundLabel: UILabel!
    
    var foundCard = AddressCard(surname: "Otten", name: "Stefanie", street: "Ernststraße", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])
    
    var book = AddressBook()
    
    var card = AddressCard(surname: "Otten", name: "Stefanie", street: "Ernststraße", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let del = UIApplication.sharedApplication().delegate as? AppDelegate {
            book = del.addressBook
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func search(sender: AnyObject) {
        print("suchen")
//        foundLabel.text = "suchen..."
        let person =  nachnameField.text ?? ""
        if let found = book.searchBySurname(person) {
            foundLabel.text = found.surname + " " + found.name
            foundCard = found
        }
    }

    
    @IBAction func searchNachname(sender: AnyObject) {
}

    @IBAction func addFriend(sender: AnyObject) {
        
            card.addFriend(foundCard)

    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
