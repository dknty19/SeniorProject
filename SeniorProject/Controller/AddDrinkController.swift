//
//  AddRestaurantController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/22/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AddDrinkController: UITableViewController {

    @IBOutlet var photoImageURL:UITextField!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var typeTextField:UITextField!
    @IBOutlet var priceTextField:UITextField!
    
    let ref = FIRDatabase.database().reference(withPath: "Restaurant/Drinks")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func addButtonDidTouch(_ sender: UIButton!) {
    
        let nameText = nameTextField.text
        let typeText = typeTextField.text
        let priceText = priceTextField.text
        let imageURL = photoImageURL.text
        
        if nameText == "" || typeText! == "" || priceText! == "" || imageURL! == "" {
            let alertController = UIAlertController(title: "Warning", message: "All fields are required!!!", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
        }else {
            // add data
            let drinkItem = Drink(name: nameText!, type: typeText!, price: Int(priceText!)!, imageURL: imageURL!)
            
            //add note child
            let drinkItemRef = self.ref.child(nameText!)
            
            //
            drinkItemRef.setValue(drinkItem.toAnyObject())
            
            performSegue(withIdentifier: "addFinish", sender: self)
        }
    }

}
