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
    var uid:String
    var table:String
    var name:String
    var quantity:Int
    var price:Int
    var image:String
    var isPay:Bool
    let ref:FIRDatabaseReference!
    var date:String
    
    init(key:String = "", uid:String, table:String, name:String, quantity:Int, price:Int, image:String, isPay:Bool, date:String) {
        self.key = key
        self.uid = uid
        self.table = table
        self.name = name
        self.quantity = quantity
        self.price = price
        self.image = image
        self.isPay = isPay
        self.date = date
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        uid = snapshotValue["uid"] as! String
        table = snapshotValue["table"] as! String
        name = snapshotValue["name"] as! String
        quantity = snapshotValue["quantity"] as! Int
        price = snapshotValue["price"] as! Int
        image = snapshotValue["image"] as! String
        isPay = snapshotValue["isPay"] as! Bool
        date = snapshotValue["date"] as! String
        ref = snapshot.ref
    }

    
    func toAnyObject() -> Any {
        return [
            "uid":uid,
            "table": table,
            "name": name,
            "quantity": quantity,
            "price": price,
            "isPay":isPay,
            "date": date
        ]
    }
}
