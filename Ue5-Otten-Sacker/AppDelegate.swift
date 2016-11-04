//
//  AppDelegate.swift
//  Ue5-Otten-Sacker
//
//  Created by Doreen on 10.12.15.
//  Copyright © 2015 Doreen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var addressBook = AddressBook()
//    var addressCard = AddressCard(surname: "Stefanie", name: "Otten", street: "Ernststraße", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])
    
    func getbookFileName() -> String? {
        
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let url = urls[urls.count-1] as NSURL
        if let path = url.path {
            // received path as String
            
            print(path)
            let filename = (path as NSString).stringByAppendingPathComponent("book.archive")
            
            print(filename)
            
            return filename
        }
        
        return nil
    }
    
    
    //diese funktion ist nur zum einspeisen von daten
    func starter(){
        let StefanieCard = AddressCard(surname: "Stefanie", name: "Otten", street: "Ernststraße", nr: 2, plz: 12437, ort: "Berlin", hobbys: ["tanzen", "lesen"])
        addressBook.addCard(StefanieCard)
        
        let PaulCard = AddressCard(surname: "Paul", name: "Adler", street: "Birkenweg", nr: 8, plz: 57368, ort: "Lennestadt", hobbys: ["Fussball", "Musik"], friends: [StefanieCard])
        addressBook.addCard(PaulCard)
        
        let TinaCard = AddressCard(surname: "Tina", name: "Müller", street: "Robert-Koch-Platz", nr: 230, plz: 22679, ort: "Hamburg", hobbys: ["reiten", "surfen"], friends: [StefanieCard, PaulCard])
        addressBook.addCard(TinaCard)
        
        addressBook.sortBook()
        
    }
    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        if let filename = getbookFileName(){
        if let _addressBook = AddressBook.addressBookFromFile(filename){
            addressBook = _addressBook
        }else {
            starter()
        }
        }
        
        return true
    }
    
    func applicationWillResignActive(application: UIApplication) {
            // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
            // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
                // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
                // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
                
                
                if let filename = getbookFileName(){
                    addressBook.saveToFile(filename)
                    
                }
    }
    
    func applicationWillEnterForeground(application: UIApplication) {
                    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
                        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
                            // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
                            
                            if let filename = getbookFileName(){
        addressBook.saveToFile(filename)
        
                            }
                            
    }
    
    
}

