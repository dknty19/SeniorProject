//
//  Cart.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/14/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct Cart {
    var key:String
    var table:String
    var name:String
    var quantity:Int
    var price:Int
    let ref:FIRDatabaseReference!
    var date:String
    
    init(key:String = "", table:String, name:String, quantity:Int, price:Int, date:String) {
        self.key = key
        self.table = table
        self.name = name
        self.quantity = quantity
        self.price = price
        self.date = date
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        table = snapshotValue["table"] as! String
        name = snapshotValue["name"] as! String
        quantity = snapshotValue["quantity"] as! Int
        price = snapshotValue["price"] as! Int
        date = snapshotValue["date"] as! String
        ref = snapshot.ref
    }

    
    func toAnyObject() -> Any {
        return [
            "table": table,
            "name": name,
            "quantity": quantity,
            "price": price,
            "date": date
        ]
    }
}
