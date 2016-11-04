//
//  AddHobbyViewController.swift
//  Ue5-Otten-Sacker
//
//  Created by Doreen on 07.01.16.
//  Copyright © 2016 Doreen. All rights reserved.
//

import UIKit

class AddHobbyViewController: UIViewController {


    var card = AddressCard(surname: "AddHobbyTest", name: "Test", street: "sdf", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])
    
    @IBOutlet weak var newHobbyField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newHobbyAdded(sender: AnyObject) {
        let h = newHobbyField.text ?? ""
        card.addHobby(h)
        print(card.surname)
        print("added \(h) ")
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
