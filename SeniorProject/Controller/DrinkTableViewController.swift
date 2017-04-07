//
//  RestaurantTableViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/20/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//
import Foundation
import UIKit

class DrinkTableViewController: UITableViewController {
    
    var drinks:[Drink] = [
        Drink(name: "Cafe Deadend", type: "Coffee & Tea Shop",price: 3 ,image: "cafedeadend.jpg"),
        Drink(name: "Homei", type: "Cafe", price: 2, image: "homei.jpg"),
        Drink(name: "Teakha", type: "Tea House", price: 3, image: "teakha.jpg"),
        Drink(name: "Cafe loisl", type: "Austrian / Causual Drink", price: 2, image: "cafeloisl.jpg"),
        Drink(name: "Palomino Espresso", type: "American Coffee", price: 1, image: "palominoespresso.jpg"),
        Drink(name: "Cafe Lore", type: "Latin American", price: 4, image: "cafelore.jpg"),
        Drink(name: "Waffle & Wolf", type: "Coffee & Tea", price: 5, image: "wafflewolf.jpg"),
        Drink(name: "Five Leaves", type: "Coffee & Tea", price: 1, image: "fiveleaves.jpg"),
        Drink(name: "Bourke Street Backery", type: "Coffee & Tea", price: 2, image: "bourkestreetbakery.jpg"),
        Drink(name: "Haigh's Chocolate", type: "Cafe", price: 3, image: "haighschocolate.jpg"),
        Drink(name: "Upstate", type: "American", price: 3, image: "upstate.jpg"),
        Drink(name: "Traif", type: "American", price: 5, image: "traif.jpg"),
        Drink(name: "Graham Avenue Meats", type: "Breakfast & Brunch", price: 2, image: "grahamavenuemeats.jpg")
    ]
    
    override func viewDidLoad() {
        //remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
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
        return drinks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DrinkTableViewCell
        
        let drink = drinks[indexPath.row]
        cell.drinkImageView.image = UIImage(named: drink.image)
        cell.nameDrinkLabel.text = drink.name
        cell.priceDrinkLabel.text = String(drink.price)
        cell.typeDrinkLabel.text = drink.type
//        cell.telephoneLabel.text = restaurant.phone
        
        //cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None
        
        return cell
    }
    
//    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        //add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//        
//        //call action
//        let callActionHandler = { (action: UIAlertAction!) -> Void in
//            
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Please try again later", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call" + "0236-\(indexPath.row)",
//            style: .Default,
//            handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        let checkInTitle = restaurantIsVisited[indexPath.row] ? "Undo Check-in" : "Check-in"
//        
//        let checkInAction = UIAlertAction(title: checkInTitle, style: .Default, handler: {
//            (action: UIAlertAction!) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            
//            //toggle checkin and undo checkin
//            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
//            cell?.accessoryType = self.restaurantIsVisited[indexPath.row] ? .Checkmark : .None
//        })
//        optionMenu.addAction(checkInAction)
//        
//        tableView.deselectRowAtIndexPath(indexPath, animated: false)
//        //display menu
//        presentViewController(optionMenu, animated: true, completion: nil)
//    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete the row from datasource
            drinks.remove(at: indexPath.row)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //social share button
        let sharedAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Share", handler: { (action, NSIndexPath) -> Void in
            let defaultText = "just checking in at " + self.drinks[indexPath.row].name
            if let imageToShare = UIImage(named: self.drinks[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        })
        sharedAction.backgroundColor = UIColor(red: 99.0/255.0, green: 145.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        
        //delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "Delete", handler: { (action, NSIndexPath) -> Void in
            self.drinks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        })
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, sharedAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDrinkDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DrinkDetailViewController
                destinationController.drink = drinks[indexPath.row]
                destinationController.hidesBottomBarWhenPushed = false
            }
        }
    }
    
    @IBAction func unwindToHomeScreen(_ segue: UIStoryboardSegue) {
    
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
    
}
