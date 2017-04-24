//
//  CartTableViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/18/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class CartTableViewController: UITableViewController {
    
    var drinkCart:Drink?
    var foodCart:Food?
//    var bills = [Bill]()
    var cart:Cart!

    override func viewDidLoad() {
        super.viewDidLoad()
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
        //return bills.count
        return superCart.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CartTableViewCell
        
            let cartItem = superCart[indexPath.row]
        
            if  let imageURL = URL.init(string: cartItem.image) {
                cell.photoImageView.downloadedFrom(url: imageURL)
            }
            cell.nameItemLabel.text = cartItem.name
            cell.quantityItemLabel.text = String(cartItem.quantity)
            cell.totalPriceLabel.text = String(cartItem.price)
        
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

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "checkOut" {
            let naviController = segue.destination as! UINavigationController
            let destinationViewController = naviController.topViewController as! CheckOutViewController
            destinationViewController.checkOut = superCart
        }
    }
    
    @IBAction func cancelCheckOut(_ segue: UIStoryboardSegue) {}
}
