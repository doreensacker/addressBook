//
//  AddressCard.swift
//  Ue3-Otten-Sacker
//
//  Created by Doreen & Stefanie on 12.11.15.
//  Copyright © 2015 Doreen. All rights reserved.
//

import Foundation
import UIKit

class AddressCard : NSObject, NSCoding{
    
    var surname :String = ""
    var name : String = ""
    var street : String = ""
    var nr : Int = 0
    var plz : Int = 0
    var ort : String = ""
    var hobbys = [String]()
    var friends = [AddressCard]()
    
    
    init(surname :String, name : String, street : String, nr : Int, plz : Int, ort : String, hobbys : [String] = [], friends : [AddressCard] = []) {
        self.surname = surname
        self.name = name
        self.street = street
        self.nr = nr
        self.plz = plz
        self.ort = ort
        self.hobbys = hobbys
        self.friends = friends
        
    }
    
    
    required init?(coder decoder: NSCoder) {
        if let _surname = decoder.decodeObjectForKey("surname")  as? String {
            surname = _surname  }
        if let _name = decoder.decodeObjectForKey("name")  as? String {
            name = _name  }
        if let _street = decoder.decodeObjectForKey("street")  as? String {
            street = _street  }
        if let _nr = decoder.decodeObjectForKey("nr")  as? Int {
            nr = _nr  }
        if let _plz = decoder.decodeObjectForKey("plz")  as? Int {
                plz = _plz  }
        if let _ort = decoder.decodeObjectForKey("ort")  as? String {
            ort = _ort }
        if let _hobbys = decoder.decodeObjectForKey("hobbys")  as? [String] {
                    hobbys = _hobbys }
        if let _friends = decoder.decodeObjectForKey("friends")  as? [AddressCard] {
            friends = _friends}
        
    }
    
    func encodeWithCoder(coder: NSCoder) {
                    coder.encodeObject(surname, forKey: "surname")
                    coder.encodeObject(name, forKey: "name")
                    coder.encodeObject(street, forKey: "street")
                    coder.encodeObject(nr, forKey: "nr")
                    coder.encodeObject(plz, forKey: "plz")
                    coder.encodeObject(ort, forKey: "ort")
                    coder.encodeObject(hobbys, forKey: "hobbys")
                    coder.encodeObject(friends, forKey: "friends")
    }
    
    
    
    func addHobby(hobby: String){
        hobbys.append(hobby)
    }
    
    func removeHobby(hobby: String){
                if let index = hobbys.indexOf(hobby){
                            hobbys.removeAtIndex(index)
                }
    }
    
    
    func addFriend(friend: AddressCard){
        friends.append(friend)
        friend.friends.append(self)
    }
    
    //zum überprüfen der freunde in freundesliste
    func findFriend(friend: AddressCard) -> Bool{
        if friends.contains(friend){
        return true
        }
        return false
    }
    
    
    func removeFriend(friend: AddressCard){
                    if let index = friends.indexOf(friend){
                                friends.removeAtIndex(index)
                    }
    }

 
    
}