//
//  OrderDetailTableViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 5/5/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import Firebase

class OrderDetailTableViewController: UITableViewController {
    
    let refCart = FIRDatabase.database().reference(withPath: "Restaurant/Carts")

    var orderDetail: Bill!
    var cartDetail: [Cart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refCart.child(orderDetail.id).queryOrdered(byChild: "id").observe(.value, with: { (snapshot) in
            var newCart: [Cart] = []
            
            for item in snapshot.children {
                let cart = Cart(snapshot: item as! FIRDataSnapshot)
                newCart.append(cart)
            }
            self.cartDetail = newCart
            self.tableView.reloadData()
            print(self.orderDetail.id)
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
        return cartDetail.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OrderDetailTableViewCell

        cell.nameLabel.text = cartDetail[indexPath.row].name
        cell.priceLabel.text = String(cartDetail[indexPath.row].price)
        cell.sttLabel.text = String(indexPath.row + 1)

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
