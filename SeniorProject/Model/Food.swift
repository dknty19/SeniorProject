//
//  Food.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 4/3/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Food {
    var key:String
    var name:String
    var imageURL:String
    var price:Int
    let ref:FIRDatabaseReference!
//    var quantity:Int?
    
    init(key:String = "", name:String, imageURL:String, price:Int) {
        self.key = key
        self.name = name
        self.imageURL = imageURL
        self.price = price
//        self.quantity = 0 as Int
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        imageURL = snapshotValue["imageURL"] as! String
        price = snapshotValue["price"] as! Int
        ref = snapshot.ref
    }
}
