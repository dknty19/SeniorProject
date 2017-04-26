//
//  CheckOutTableViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/24/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CheckOutTableViewController: UITableViewController {

    let ref = FIRDatabase.database().reference(withPath: "Restaurant/Bills/Tables "+tableNumber)
    
//    @IBOutlet var tableTextField:UITextField!
    @IBOutlet var totalTextField:UITextField!
    
    var checkOut = [Cart]()
    var total = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if checkOut.count == 0 {
            totalTextField.text = String(total)
        }else {
            for i in 0...checkOut.count - 1 {
                total += checkOut[i].price
            }
            totalTextField.text = String(total)
        }
        
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
        return checkOut.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CheckOutTableViewCell

        cell.nameTextField.text = checkOut[indexPath.row].name
        cell.priceTextField.text = String(checkOut[indexPath.row].price)

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
    
    @IBAction func checkOut(sender: UIButton!) {
        if checkOut.count == 0 {
            let alertController = UIAlertController(title: "Warning!", message: "There is nothing to purchase. Please come back and choose one item.", preferredStyle: .alert)
            let defautlAction = UIAlertAction(title: "OK", style: .default, handler: nil
//                { _ in                self.dismiss(animated: true, completion: nil)}
            )
            alertController.addAction(defautlAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            for i in 0...(self.checkOut.count - 1) {
                let uid = self.checkOut[i].uid
                let table = self.checkOut[i].table
                let name = self.checkOut[i].name
                let price = self.checkOut[i].price
                let isPay = self.checkOut[i].isPay
                let image = self.checkOut[i].image
                let quantity = self.checkOut[i].quantity
                let date = self.checkOut[i].date
                
                // add data
                let cartItem = Cart(uid: uid, table: table, name: name, quantity: quantity, price: price, image: image, isPay:isPay, date: date)
                
                //add note child
                let cartItemRef = self.ref.child(date)
                
                //
                cartItemRef.setValue(cartItem.toAnyObject())
            }
            superCart.removeAll()
        }
    }
}
