//
//  DrinkList.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/27/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DrinkList {
    var name: String
    var id: String
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    init(name: String) {
        let drinkListRef = FIRDatabase.database().reference().child("drinklist/\(currentRestaurantID)")
        self.id = drinkListRef.childByAutoId().key
        self.name = name
    }
    
    static func loadDrinkList(_ currentRestaurantID: String, callback: @escaping ([DrinkList]) -> Void){
        var drinkList = [DrinkList]()
        let drinkListRef = FIRDatabase.database().reference().child("drinklist/\(currentRestaurantID)")
        
        drinkListRef.observeSingleEvent(of: .value, with: { (tableSnapshot) in
            guard tableSnapshot.childrenCount > 0 else {
                callback(drinkList)
                return }
            
            for child in tableSnapshot.children {
                guard let list = child as? FIRDataSnapshot else { continue }
                
                let listKey = list.key
                let ref = drinkListRef.child(listKey)
                var count = Int(tableSnapshot.childrenCount)
                ref.observeSingleEvent(of: .value, with: { (snapshot) in
                    
                    guard let id = snapshot.childSnapshot(forPath: "id").value as? String,
                        let name = snapshot.childSnapshot(forPath: "name").value as? String else {
                            count -= 1
                            if drinkList.count == count {
                                callback(drinkList)
                            }
                            return
                    }
                    let list = DrinkList(id: id, name: name)
                    drinkList.append(list)
                    if drinkList.count == count {
                        callback(drinkList)
                    }
                })
            }
        })
    }
}
