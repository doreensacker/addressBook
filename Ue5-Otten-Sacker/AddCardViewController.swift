//
//  AddCardViewController.swift
//  Ue5-Otten-Sacker
//
//  Created by Doreen on 07.01.16.
//  Copyright © 2016 Doreen. All rights reserved.
//

import UIKit

class AddCardViewController: UIViewController {
    
    var book = AddressBook()
    
    @IBOutlet weak var nachnameField: UITextField!

    @IBOutlet weak var vornameField: UITextField!
    
    @IBOutlet weak var strasseField: UITextField!
    
    @IBOutlet weak var nrField: UITextField!
    
    @IBOutlet weak var plzField: UITextField!
    
    @IBOutlet weak var ortField: UITextField!
    
    @IBOutlet weak var hobby1Field: UITextField!
    
    @IBOutlet weak var hobby2Field: UITextField!
    
    
    var vorname = ""
    var nachname = ""
    var strasse = ""
    var nr = 0
    var plz = 0
    var ort = ""
    var hobbys : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let del = UIApplication.sharedApplication().delegate as? AppDelegate {
            book = del.addressBook
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func addVorname(sender: AnyObject) {
        vorname = vornameField.text ?? ""
    }
    
    @IBAction func addNachname(sender: AnyObject) {
        nachname = nachnameField.text ?? ""
    }
    
    @IBAction func addStrasse(sender: AnyObject) {
        strasse = strasseField.text ?? ""
    }
    
    @IBAction func addNr(sender: AnyObject) {
        nr = intFromTextField(nrField)
    }
    
    @IBAction func addPlz(sender: AnyObject) {
        plz = intFromTextField(plzField)
    }
    
    @IBAction func addOrt(sender: AnyObject) {
        ort = ortField.text ?? ""
    }
    
    @IBAction func addHobby1(sender: AnyObject) {
        let hobby1 = hobby1Field.text ?? ""
        hobbys.append(hobby1)
    }
    
    @IBAction func addHobby2(sender: AnyObject) {
        let hobby2 = hobby2Field.text ?? ""
        hobbys.append(hobby2)
       
    }
    
    
    @IBAction func Add(sender: AnyObject) {
        let card = AddressCard(surname: vorname, name: nachname, street: strasse, nr: self.nr, plz: self.plz, ort: self.ort, hobbys: self.hobbys)
        book.addCard(card)
        book.sortBook()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    func intFromTextField(field: UITextField) -> Int{
        if let input = field.text{
            if let d = Int(input){
                return d
            }
        }
        return 0
    }
    

}
