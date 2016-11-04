//
//  AddressCard.swift
//  Ue3-Otten-Sacker
//
//  Created by Doreen & Stefanie on 12.11.15.
//  Copyright © 2015 Doreen. All rights reserved.
//

import Foundation
import UIKit

class AddressBook : NSObject, NSCoding{
    

    var list = [AddressCard]()
    var sectionTitles = [Character]()
    var cards = [[AddressCard]] ()
    let sectionIcon = UIImage(named:"iconF.png")
    
    init(list : [AddressCard] = []) {
      self.list = list
        
    }
    
    required init?(coder decoder: NSCoder) {
        if let _list = decoder.decodeObjectForKey("list")  as? [AddressCard] {
            list = _list  }
    }
    
    func encodeWithCoder(coder: NSCoder) {
                    coder.encodeObject(list, forKey: "list")
    }
    
    func getSectionTitlesNames(){
        cards.removeAll()
        sectionTitles.removeAll()
        
        for card in list{
            let index = card.name.startIndex
            let anfangsBuchstabe = card.name[index]
            
            if (!sectionTitles.contains(anfangsBuchstabe)){
                sectionTitles.append(anfangsBuchstabe)
                let insertCard = [card]
                cards.append(insertCard)
            }else{
                if let cardsIndex = sectionTitles.indexOf(anfangsBuchstabe){
                    var cardsInArray = cards[cardsIndex]
                    cards.removeAtIndex(cardsIndex)
                    cardsInArray.append(card)
                    cards.insert(cardsInArray, atIndex: (cardsIndex))
                
                }
            }
            
        }
    }
    
    
    
    func addCard(card: AddressCard){
        list.append(card)
    }
    
   func removeCard(card: AddressCard){
        for friend in card.friends{
        friend.removeFriend(card)
    }
    
        if let index = list.indexOf(card){
            list.removeAtIndex(index)
        }
    }
    
    func sortBook(){
    list.sortInPlace {
        //oben a bis unten z
        $0.name < $1.name
        }
    }
    
    func searchBySurname(surname: String) -> AddressCard?{
        let card : AddressCard?
        for cards in self.list{
            if cards.surname == surname{
                card = cards
                return card
            }
        }
        return nil
    }
    
    
    func saveToFile(path: String){

        if NSKeyedArchiver.archiveRootObject(self, toFile: path) {
            print("Save succeeded")
        }
        
    }
    
    class func addressBookFromFile(path: String) -> AddressBook?{
    
    if let loaded = NSKeyedUnarchiver.unarchiveObjectWithFile(path)   as? AddressBook {
        return loaded
            }
     return nil
    }

    
    
    
}



