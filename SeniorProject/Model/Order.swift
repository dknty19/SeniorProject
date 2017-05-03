//
//  Order.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/27/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

enum OrderStatus: String {
    case ordering = "ordering"
    case cooking = "cooking"
    case cooked = "cooked"
    case billed = "billed"
    case error = "error"
}


class Order {
    var id: String
    var foodID: String
    var quantity: Int
    var billID: String
    var status: OrderStatus {
        didSet {
            if status == OrderStatus.ordering || status == OrderStatus.cooking {
                print("Update Bill Status")
            }
        }
    }
    var date: String
    
    init(foodID: String, quantity: Int, billID: String, status: OrderStatus, date: String) {
        let orderRef = FIRDatabase.database().reference().child("orders")
        self.id = orderRef.childByAutoId().key
        self.foodID = foodID
        self.quantity = quantity
        self.billID = billID
        self.status = status
        self.date = date
    }
    
    init(id: String, foodID: String, quantity: Int, billID: String, status: OrderStatus, date: String) {
        self.id = id
        self.foodID = foodID
        self.quantity = quantity
        self.billID = billID
        self.status = status
        self.date = date
    }
    init(_ order: Order) {
        self.id = order.id
        self.foodID = order.foodID
        self.quantity = order.quantity
        self.billID = order.billID
        self.status = order.status
        self.date = order.date
    }
    
    init(_ snapshot: FIRDataSnapshot) {
        id = ""
        foodID = ""
        quantity = 0
        billID = ""
        status = OrderStatus.error
        date = ""
        if snapshot.hasChild("id") {
            id = snapshot.childSnapshot(forPath: "id").value as! String
        }
        if snapshot.hasChild("foodID") {
            foodID = snapshot.childSnapshot(forPath: "foodID").value as! String
        }
        if snapshot.hasChild("quantity") {
            quantity = snapshot.childSnapshot(forPath: "quantity").value as! Int
        }
        if snapshot.hasChild("billID") {
            billID = snapshot.childSnapshot(forPath: "billID").value as! String
        }
        if snapshot.hasChild("status") {
            let statusString = snapshot.childSnapshot(forPath: "status").value as! String
            status = OrderStatus(rawValue: statusString) ?? OrderStatus.error
        }
        if snapshot.hasChild("date") {
            date = snapshot.childSnapshot(forPath: "date").value as! String
        }
    }
    
    func getPrice(callback: @escaping (Double) -> Void){
        var price: Double = 0.0
        let foodPriceRef = FIRDatabase.database().reference().child("foodprices")
        foodPriceRef.observeSingleEvent(of: .value, with: { (foodPriceSnapshot) in
            if foodPriceSnapshot.hasChild(self.foodID) {
                price = foodPriceSnapshot.childSnapshot(forPath: self.foodID).value as! Double
                callback(price)
                return
            }
            callback(price)
        })
    }
    
    func changeStatus(){
        if self.status == OrderStatus.ordering {
            self.status = OrderStatus.cooking
            updateStatusToFirebase()
        } else if self.status == OrderStatus.cooking {
            self.status = OrderStatus.cooked
            updateStatusToFirebase()
        }
    }
    
    func updateStatusToFirebase() {
        FIRDatabase.database().reference().child("orders/\(self.billID)/\(self.id)/status").setValue(self.status.rawValue)
    }
    
}
