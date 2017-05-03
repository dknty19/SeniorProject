//
//  Core.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/20/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import Firebase

var superCart = [Cart]()
var tableNumber = 1
var externalUid = FIRAuth.auth()?.currentUser!.uid
