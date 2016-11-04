//
//  DeleteFriendViewController.swift
//  Ue5-Otten-Sacker
//
//  Created by Doreen on 09.01.16.
//  Copyright © 2016 Doreen. All rights reserved.
//

import UIKit

class DeleteFriendViewController: UIViewController {

    @IBOutlet weak var friendLabel: UILabel!
    
    var card = AddressCard(surname: "AddHobbyTest", name: "Test", street: "sdf", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])
    var indexFriend = 0
    var friend = AddressCard(surname: "AddHobbyTest", name: "Test", street: "sdf", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])


    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendLabel.text = friend.surname + " " + friend.name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteFriend(sender: AnyObject) {
        card.removeFriend(friend)
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
