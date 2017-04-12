//
//  Drink.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 4/3/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class Drink {
    var key:String
    var name:String
    var type:String
    var price:Int
    let ref:FIRDatabaseReference!
    var quantity:Int?
    var imageURL:String
    
    init(key:String = "", name:String, type: String, price: Int, imageURL: String) {
        self.key = key
        self.name = name
        self.type = type
        self.price = price
        self.imageURL = imageURL
        self.quantity = 0 as Int
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        type = snapshotValue["type"] as! String
        imageURL = snapshotValue["imageURL"] as! String
        price = snapshotValue["price"] as! Int
        ref = snapshot.ref
    }

    func toAnyObject() -> Any {
    return [
        "name": name,
        "type": type,
        "imageURL": imageURL,
        "price": price
    ]
    }
}
