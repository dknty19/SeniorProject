//
//  Table.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 5/4/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct Table {
    var key:String
    var id:String
//    var imageURL:String
    let ref:FIRDatabaseReference!
    
    
    init(key:String, id:String, imageURL:String) {
        self.key = key
        self.id = id
//        self.imageURL = imageURL
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot) {
        key = snapshot.key
        let snapshotValue = snapshot.value as! [String: AnyObject]
        id = snapshotValue["id"] as! String
//        imageURL = snapshotValue["imageURL"] as! String
        ref = snapshot.ref
    }
}
