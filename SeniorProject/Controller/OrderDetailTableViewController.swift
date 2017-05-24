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
    
    let refBill = FIRDatabase.database().reference(withPath: "Restaurant/Bills")
    let refCart = FIRDatabase.database().reference(withPath: "Restaurant/Carts")

    var orderDetail: Bill!
    var cartDetail: [Cart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            refCart.child(orderDetail.id).queryOrdered(byChild: "id").observeSingleEvent(of: FIRDataEventType.value, with: { (snapshot) in
                var newCart: [Cart] = []
                
                for item in snapshot.children {
                    let cart = Cart(snapshot: item as! FIRDataSnapshot)
                    newCart.append(cart)
                }
                self.cartDetail = newCart
                
                self.tableView.reloadData()
            })
//        navigationItem.title = ""
        tableView.tableFooterView = UIView(frame: CGRect.zero)
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
        cell.priceLabel.text = String(cartDetail[indexPath.row].price) + " $"
        if let imageURL = URL.init(string: cartDetail[indexPath.row].image!) {
            cell.orderDetailImageView.downloadedFrom(url: imageURL)
        }
        cell.orderDetailImageView.layer.cornerRadius = 20.0
        cell.orderDetailImageView.clipsToBounds = true

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            print(cartDetail[indexPath.row].id!)
            refCart.child(orderDetail.id).child(cartDetail[indexPath.row].id!).removeValue()
            
            cartDetail.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            if cartDetail.count == 0 {
                refBill.child(orderDetail.id).removeValue()
//                tableView.reloadData()
            }
        }
    }

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
