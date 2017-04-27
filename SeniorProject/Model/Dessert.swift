//
//  Desert.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/25/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Dessert {
    var key:String
    var name:String
    var imageURL:String
    var price:Int
//    var description:String
    let ref:FIRDatabaseReference!
    
    
    init(key:String = "", name:String, imageURL:String, price:Int/*, description:String*/) {
        self.key = key
        self.name = name
        self.imageURL = imageURL
        self.price = price
//        self.description = description
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        name = snapshotValue["name"] as! String
        imageURL = snapshotValue["imageURL"] as! String
        price = snapshotValue["price"] as! Int
//        description = snapshotValue["description"] as! String
        ref = snapshot.ref
    }
}

