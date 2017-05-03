//
//  Table.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/27/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import FirebaseDatabase
import os.log

enum TableStatus: String {
    case ordering = "ordering"
    case unpaid = "eating"
    case empty = "empty"
}

enum QueryBy: String {
    case name
    case id
    case status
}
class Table {
    var id: String
    var name: String
    var status: TableStatus = TableStatus.empty {
        didSet {
            print("Update Table Status")
        }
    }
    var chairs: UInt
    
    init(name: String) {
        self.id = FIRDatabase.database().reference().child("tables/\(currentRestaurantID)").childByAutoId().key
        self.name = name
        self.chairs = 0
    }
    
    init(_ table: Table) {
        self.status = table.status
        self.chairs = table.chairs
        self.id = table.id
        self.name = table.name
    }
    
    init(id: String, name: String, status: TableStatus) {
        self.id = id
        self.name = name
        self.status = status
        self.chairs = 0
    }
    init(id: String, name: String, status: TableStatus, chairs: UInt) {
        self.id = id
        self.name = name
        self.status = status
        self.chairs = chairs
    }
    
    static func changStatusToOrdering(tableID: String) {
        let tableStatusRef = FIRDatabase.database().reference().child("tables/\(currentRestaurantID)/\(tableID)/status")
        tableStatusRef.setValue("ordering")
    }
}
