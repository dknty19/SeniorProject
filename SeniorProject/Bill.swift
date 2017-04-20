//
//  Bill.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/14/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation

struct Bill {
//    var table:Int
    var name:String
    var quantity:Int
    var price:Int
//    var date:String
    
    init(/*table:Int,*/ name:String, quantity:Int, price:Int/*, date:String*/) {
//        self.table = table
        self.name = name
        self.quantity = quantity
        self.price = price
//        self.date = date
    }
}
