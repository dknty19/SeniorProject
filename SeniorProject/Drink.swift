//
//  Drink.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 4/3/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
class Drink {
    var name: String
    var type: String
    var price: Int
    var image: String
    
    init(name: String, type: String, price: Int, image: String) {
        self.name = name
        self.type = type
        self.price = price
        self.image = image
    }
}