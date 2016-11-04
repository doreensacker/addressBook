//
//  RootViewController.swift
//  Ue5-Otten-Sacker
//
//  Created by Doreen on 10.12.15.
//  Copyright © 2015 Doreen. All rights reserved.
//

import UIKit

class RootViewController: UITableViewController {
    
    var book = AddressBook()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let del = UIApplication.sharedApplication().delegate as? AppDelegate {
            book = del.addressBook
        }
        
        book.getSectionTitlesNames()
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    //Immer wenn View neu angezeigt wird
    override func viewWillAppear(animated: Bool) {
        book.getSectionTitlesNames()
        //Alle Daten neu laden
        self.tableView.reloadData()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        //        return book.list.count
        
        return book.sectionTitles.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //        return book.list.count
        
        return book.cards[section].count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        // Configure the cell...
        
        let fullName = book.cards[indexPath.section][indexPath.row].name + " " + book.cards[indexPath.section][indexPath.row].surname
        
        //        let fullName = book.list[indexPath.row].name + "" + book.list[indexPath.row].surname
        let streetAndNr = book.cards[indexPath.section][indexPath.row].street + " " + String(book.cards[indexPath.section][indexPath.row].nr)
        
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = streetAndNr
        cell.imageView?.image = book.sectionIcon
        
        return cell
    }
    
    override func tableView(tableView:UITableView,  titleForHeaderInSection section: Int) -> String?{
        return String(book.sectionTitles[section])
    }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {

            // Delete the row from the data source
//            let cardToDelete = book.cards[indexPath.section][indexPath.row]
//
//            let index = cardToDelete.name.startIndex
//            let anfangsBuchstabe = cardToDelete.name[index]
//            var cardsWithSameLettter : Int
//            if let cardsIndex = book.sectionTitles.indexOf(anfangsBuchstabe){
//                cardsWithSameLettter = book.cards[cardsIndex].count
//            }
            book.cards[indexPath.section].removeAtIndex(indexPath.row)
//              book.removeCard(book.cards[indexPath.section][indexPath.row])
//            book.removeCard(cardToDelete)
            
            
//            book.getSectionTitlesNames()
//            self.tableView.reloadData()
            
              tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//            if(!(cardsWithSameLettter>0)){
//
//                   tableView.deleteSections(, withRowAnimation: .Fade)
//            }


        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        //        let name = book.list[fromIndexPath.row]
        //        book.list.removeAtIndex(fromIndexPath.row)
        //        book.list.insert(name, atIndex: toIndexPath.row)
        
        let name = book.cards[fromIndexPath.section][fromIndexPath.row]
        book.cards[fromIndexPath.section].removeAtIndex(fromIndexPath.row)
        book.cards[toIndexPath.section].insert(name, atIndex: toIndexPath.row)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
 
        
        if let zielController = segue.destinationViewController as? DetailViewController{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                zielController.indexPath = indexPath
                zielController.card = book.cards[indexPath.section][indexPath.row]
                
            }
            
        }
        
    }
    
    @IBAction func back(segue: UIStoryboardSegue) {
        // some work to do when arriving here?
    }
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
