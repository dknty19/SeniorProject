//
//  FoodTableViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 4/3/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var foods:[Food] = [
        Food(name: "charcuterie", image:"charcuterie", price: 2, quantity: Int()),
        Food(name: "Custard French Toast", image:"custard-french-toast", price: 15, quantity: Int()),
        Food(name: "Fried Eggs", image:"Fried-eggs", price: 3, quantity: Int()),
        Food(name: "Island Duck", image:"island-duck", price: 2, quantity: Int()),
        Food(name: "Lamb Salad", image:"lamb-salad", price: 4, quantity: Int()),
        Food(name: "Pappardelle", image:"pappardelle", price: 3, quantity: Int()),
        Food(name: "Pasta Lamb Ragu", image:"pasta-lamb-ragu", price: 3, quantity: Int()),
        Food(name: "Pork Rillette", image:"pork-rillette", price: 4, quantity: Int()),
        Food(name: "Smoked Pock", image:"smoked-pork", price: 2, quantity: Int()),
        Food(name: "charcuterie", image:"charcuterie", price: 3, quantity: Int()),
        Food(name: "Island Duck", image:"island-duck", price: 3, quantity: Int()),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FoodTableViewCell

        cell.nameFoodLabel.text = foods[indexPath.row].name
        cell.foodImageView.image = UIImage(named: foods[indexPath.row].image)
        cell.priceFoodLabel.text = String(foods[indexPath.row].price)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFoodDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! FoodDetailTableViewController
                destinationController.food = foods[indexPath.row]
                destinationController.hidesBottomBarWhenPushed = false
            }
        }
    }
}
