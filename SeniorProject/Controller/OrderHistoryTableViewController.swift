//
//  OrderHistoryTableViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/26/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import FirebaseDatabase

class OrderHistoryTableViewController: UITableViewController {

    var orderHistory: [Bill] = []
    var orderHistoryID: [Bill] = []
    var cart: [Cart] = []
    var total = 0
    let refBill = FIRDatabase.database().reference(withPath: "Restaurant/Bills")
    let refCart = FIRDatabase.database().reference(withPath: "Restaurant/Carts")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refBill.queryOrdered(byChild: "id").observe(.value, with: { snapshot in
            var newOrderHistory: [Bill] = []
            
            for item in snapshot.children {
                let bill = Bill(snapshot: item as! FIRDataSnapshot)
                newOrderHistory.append(bill)
            }
            self.orderHistory = newOrderHistory

            for i in 0...self.orderHistory.count - 1 {
                if self.orderHistory[i].uid == externalUid! {
                    self.orderHistoryID.append(self.orderHistory[i])
//                    print(self.orderHistoryID.count)
                }
            }
            self.tableView.reloadData()
        })
        
        refCart.queryOrdered(byChild: "id").queryEqual(toValue: "Kii1occ1TsZny8yvdMK").observe(.value, with: { snapshot in
            var newCart: [Cart] = []
            
            for item in snapshot.children {
                let cart = Cart(snapshot: item as! FIRDataSnapshot)
                newCart.append(cart)
            }
            self.cart = newCart
            
            for i in 0...self.cart.count - 1 {
                self.total += self.cart[i].price * self.cart[i].quantity
            }
            self.tableView.reloadData()
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return orderHistoryID.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OrderHistoryTableViewCell

        let orderHistoryItem = orderHistoryID[indexPath.row]
        cell.idBillTextField.text = orderHistoryItem.id
        cell.nameTextField.text = String(orderHistoryID.count)
        cell.totalPriceTextField.text = String(total)
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}