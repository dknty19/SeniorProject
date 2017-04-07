//
//  Restaurant.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/21/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
class Restaurant {
    var name: String?
    var location: String?
    var type: String?
    var image: String?
    var phone: String?
    var isVisited: Bool
    var rating = ""
    
    init(name: String?, type: String?, location: String?, phone: String?, image: String?, isVisited: Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.phone = phone
        self.image = image
        self.isVisited = isVisited
    }
}