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
//    var uid:String
    var id:String?
    var idBill:String
    var name:String
    var quantity:Int
    var price:Int
    var image:String?
//    var isPay:Bool?
    let ref:FIRDatabaseReference!
//    var date:String
    
    init(key:String = "", /*uid:String,*/ id:String?, idBill:String, name:String, quantity:Int, price:Int, image:String? /*isPay:Bool?,*/) {
        self.key = key
//        self.uid = uid
        self.id = id
        self.idBill = idBill
        self.name = name
        self.quantity = quantity
        self.price = price
        self.image = image
//        self.isPay = isPay
//        self.date = date
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
//        uid = snapshotValue["uid"] as! String
        id = snapshotValue["id"] as? String
        idBill = snapshotValue["idBill"] as! String
        name = snapshotValue["name"] as! String
        quantity = snapshotValue["quantity"] as! Int
        price = snapshotValue["price"] as! Int
        image = snapshotValue["image"] as? String
//        isPay = snapshotValue["isPay"] as? Bool
//        date = snapshotValue["date"] as! String
        ref = snapshot.ref
    }

    
    func toAnyObject() -> Any {
        return [
//            "uid":uid,
            "id":id!,
            "idBill": idBill,
            "name": name,
            "quantity": quantity,
            "price": price,
//            "isPay":isPay!,
//            "date": date
        ]
    }
}
