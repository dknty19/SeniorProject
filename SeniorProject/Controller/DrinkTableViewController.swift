//
//  RestaurantTableViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/20/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//
import Foundation
import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class DrinkTableViewController: UITableViewController {
    
    var drinks:[Drink] = []
    
    
    override func viewDidLoad() {
        
        // properties
        let ref = FIRDatabase.database().reference(withPath: "Restaurant/Drinks")
        
        //remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        
        //add data to firebase
        ref.queryOrdered(byChild: "name").observe(.value, with: { snapshot in
            var newDrinks: [Drink] = []
            
            for item in snapshot.children {
                let drink = Drink(snapshot: item as! FIRDataSnapshot)
                newDrinks.append(drink)
            }
            
            self.drinks = newDrinks
            self.tableView.reloadData()
        })
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
        
        let drinkItem = drinks[indexPath.row]
        cell.nameDrinkLabel.text = drinkItem.name
        cell.priceDrinkLabel.text = String(drinkItem.price) + "$"
        cell.typeDrinkLabel.text = drinkItem.type
        if let imageURL = URL.init(string: drinkItem.imageURL) {
            cell.drinkImageView.downloadedFrom(url: imageURL)
        }
        
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

    /* delete cell and share button
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
    */
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDrinkDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
//                let naviController = segue.destination as! UINavigationController
                let destinationController = segue.destination as! DrinkDetailViewController
                destinationController.drink = drinks[indexPath.row]
                destinationController.hidesBottomBarWhenPushed = true
            }
        }
    }
    
    @IBAction func unwindToHomeScreen(_ segue: UIStoryboardSegue) {}
    
    @IBAction func cancelAddDrink(_ segue: UIStoryboardSegue) {}
    
    @IBAction func cancelDetailDrink(_ segue: UIStoryboardSegue) {}
}
