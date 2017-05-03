//
//  Bill.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/27/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class Bill {
    var key:String
    //    var uid:String
    var id:String
    var uid:String
    var isPay:Bool
    let ref:FIRDatabaseReference!
    var table:Int
    var total:Int
    
    init(key:String = "", id:String, uid:String, isPay:Bool, table:Int, total:Int) {
        self.key = key
        self.id = id
        self.uid = uid
        self.isPay = isPay
        self.table = table
        self.total = total
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        //        uid = snapshotValue["uid"] as! String
        id = snapshotValue["id"] as! String
        uid = snapshotValue["uid"] as! String
        table = snapshotValue["table"] as! Int
        isPay = snapshotValue["isPay"] as! Bool
        total = snapshotValue["total"] as! Int
        ref = snapshot.ref
    }
    
    
    func toAnyObject() -> Any {
        return [
            "id":id,
            "uid":uid,
            "isPay":isPay,
            "table":table,
            "total":total
        ]
    }

}

