//
//  EditDetailViewController.swift
//  Ue5-Otten-Sacker
//
//  Created by Doreen on 06.01.16.
//  Copyright © 2016 Doreen. All rights reserved.
//

import UIKit

class EditDetailViewController: UIViewController {

    @IBOutlet weak var detailField: UITextField!
    
    var indexPath = NSIndexPath()
    var indexHobby = 0
    
    
    var card = AddressCard(surname: "Otten", name: "Stefanie", street: "Ernststraße", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailField.text = card.hobbys[indexHobby]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func detailChanged(sender: AnyObject) {
        
        card.hobbys[indexHobby] = detailField.text ?? ""
    }

    @IBAction func deleteHobby(sender: AnyObject) {
        card.removeHobby(card.hobbys[indexHobby])
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
