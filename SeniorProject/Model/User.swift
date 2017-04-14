//
//  User.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/28/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import FirebaseAuth

struct User {
    var uid:String
    var email:String
    
    init(authData: FIRUser) {
        uid = authData.uid
        email = authData.email!
    }
    
    init(uid:String, email:String) {
        self.uid = uid
        self.email = email
    }
}
