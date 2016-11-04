//
//  DetailViewController.swift
//  Ue5-Otten-Sacker
//
//  Created by Doreen on 10.12.15.
//  Copyright © 2015 Doreen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewFriends: UITableView!
    
    
    @IBOutlet weak var strasseField: UITextField!
    
    @IBOutlet weak var vornameField: UITextField!
    
    @IBOutlet weak var nachnameField: UITextField!
    
    @IBOutlet weak var nrField: UITextField!
    
    @IBOutlet weak var plzField: UITextField!
    
    @IBOutlet weak var ortField: UITextField!
    
    var indexPath = NSIndexPath()
    var card = AddressCard(surname: "DetailTest", name: "testDetail", street: "Ernststraße", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vornameField.text = card.surname
        nachnameField.text = card.name
        strasseField.text = card.street
        intInTextField(card.nr, field: nrField)
        intInTextField(card.plz, field: plzField)
        ortField.text = card.ort

    }
    
    //Immer wenn View neu angezeigt wird
    override func viewWillAppear(animated: Bool) {
        //Alle Daten neu laden
        self.tableView.reloadData()
        self.tableViewFriends.reloadData()
        for h in card.hobbys{
            print(h + " will")
        }

    }
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
        self.tableViewFriends.reloadData()
        for h in card.hobbys{
            print(h + "did")
        }
    }
    
    //Immer wenn View neu angezeigt wird
//    override func viewWillAppear(animated: Bool) {
//        //Alle Daten neu laden
//        self.tableView.reloadData()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func vornameChanged(sender: AnyObject) {
        card.surname = vornameField.text  ?? ""

    }
    @IBAction func nachnameChanged(sender: AnyObject) {
        card.name = nachnameField.text ?? ""

    }
    @IBAction func strasseChanged(sender: AnyObject) {
        card.street = strasseField.text ?? ""
    }
    
    
    @IBAction func nrChanged(sender: AnyObject) {
        card.nr = intFromTextField(nrField)
    }

    @IBAction func plzChanged(sender: AnyObject) {
        card.plz = intFromTextField(ortField)
    }
    
    @IBAction func ortChanged(sender: AnyObject) {
        card.ort = ortField.text ?? ""
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
    
    func intInTextField(d: Int, field: UITextField){
        
        let myString = String(d)
        field.text = myString
        
    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        
//        return card.hobbys.count
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == self.tableView){
        // #warning Incomplete implementation, return the number of rows
        return card.hobbys.count
        }
        else{
            return card.friends.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (tableView == self.tableView){
        let cellHobby = tableView.dequeueReusableCellWithIdentifier("hobbyCell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        let hobby = card.hobbys[indexPath.row]
        
        //        let fullName = book.list[indexPath.row].name + "" + book.list[indexPath.row].surname
        
        cellHobby.textLabel?.text = hobby
        
        return cellHobby
            
        }else{
            let cellFriend = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath)
            
            // Configure the cell...
            
            let friend = card.friends[indexPath.row]
            let friendName = friend.surname + " " + friend.name
            //        let fullName = book.list[indexPath.row].name + "" + book.list[indexPath.row].surname
            
            cellFriend.textLabel?.text = friendName
            
            return cellFriend
        }
    }
    
//    func tableView(tableView:UITableView,  titleForHeaderInSection section: Int) -> String?{
//        return String(card.hobbys[section])
//    }
    
    // Override to support editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            card.removeHobby(card.hobbys[indexPath.section])
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if let zielController = segue.destinationViewController as? EditDetailViewController{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                zielController.indexPath = indexPath
                zielController.indexHobby = indexPath.row
                zielController.card = self.card
            }
            
        }
        
        else if let zielControllerHobby = segue.destinationViewController as? AddHobbyViewController{
                zielControllerHobby.card = self.card
            
        }
        else if let zielControllerFriend = segue.destinationViewController as? AddFriendViewController{

                zielControllerFriend.card = self.card

        }
        else if let zielControllerDeleteFriend = segue.destinationViewController as? DeleteFriendViewController{
            
            
            if let indexPath = self.tableViewFriends.indexPathForSelectedRow{
                let friend = card.friends[indexPath.row]
                zielControllerDeleteFriend.indexFriend = indexPath.row
                zielControllerDeleteFriend.friend = friend
                zielControllerDeleteFriend.card = self.card
            }
            
            
        }
        
        
    }
    
    @IBAction func backToDetail(segue: UIStoryboardSegue) {
        // some work to do when arriving here?
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
//    // Override to support rearranging the table view.
//    func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//        
//        //        let name = book.list[fromIndexPath.row]
//        //        book.list.removeAtIndex(fromIndexPath.row)
//        //        book.list.insert(name, atIndex: toIndexPath.row)
////        
////        let name = book.cards[fromIndexPath.section][fromIndexPath.row]
////        book.cards[fromIndexPath.section].removeAtIndex(fromIndexPath.row)
////        book.cards[toIndexPath.section].insert(name, atIndex: toIndexPath.row)
//    }

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        if let zielController = segue.destinationViewController as? DetailViewController{
//            if let indexPath = self.tableView.indexPathForSelectedRow{
//                zielController.indexPath = indexPath
//                zielController.card = book.cards[indexPath.section][indexPath.row]
//                
//            }
//            
//        }
//        
//    }

}
