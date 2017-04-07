//
//  Food.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 4/3/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation

class Food {
    var name:String
    var image:String
    var price:Int
    var quantity:Int?
    
    init(name:String, image:String, price:Int, quantity:Int?) {
        self.name = name
        self.image = image
        self.price = price
        self.quantity = quantity
    }
}