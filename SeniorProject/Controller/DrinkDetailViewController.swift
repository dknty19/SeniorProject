//
//  RestaurantDetailViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/21/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class DrinkDetailViewController: UIViewController {
    
    @IBOutlet var drinkImageView:UIImageView!
    @IBOutlet var totalTextField:UITextField!
    @IBOutlet var descriptionTextField:UITextField!
    @IBOutlet var increLabel:UILabel!
    @IBOutlet var priceLabel:UILabel!
    @IBOutlet var nameDrinkLabel:UILabel!
    
    var defaultQuantity = 1
//    var total = 0
    
    var bill:Bill!
    var bills = [Bill]()
    var drink:Drink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageURL = URL.init(string: drink.imageURL) {
            drinkImageView.downloadedFrom(url: imageURL)
        }
        
        //background color in table view
//        tableView.backgroundColor = UIColor(red: 225.0/255.0, green: 85.0/255.0, blue: 80.0/255.0, alpha: 0.2)
        
        //title nav bar
        title = drink.name
        
        descriptionTextField.text = drink.type
        increLabel.text = String(defaultQuantity)
        priceLabel.text = String(drink.price)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @IBAction func close(segue:UIStoryboardSegue) {
//        
//    }
    
//    @IBAction func ratingButtonTapped(segue:UIStoryboardSegue) {
//        if let rating = segue.identifier {
//            restaurant.isVisited = true
//            switch rating {
//            case "great": restaurant.rating = "I love it so much"
//            case "good": restaurant.rating = "Good"
//            case "dislike": restaurant.rating = "Bad"
//            default: break
//            }
//        }
//        
//        tableView.reloadData()
//    }
    
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    //passing image to reviewViewController
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showReview" {
//            let destinationController = segue.destinationViewController as ReviewViewController
//            destinationController.restaurant = restaurant
//        }
//    }
    
    @IBAction func submitOrder(_ sender: UIButton!) {
        
    }
    
    @IBAction func addDrinkToLabel(_ sender: UIButton) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addToCart" {
            defaultQuantity += 1
            increLabel.text = "\(defaultQuantity)"
            
            nameDrinkLabel.text = drink.name
            totalTextField.text = String(defaultQuantity * drink.price)
            
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.switchToCartTab()
            
            let quantity = Int(increLabel.text!)!
            let price = Int(totalTextField.text!)!
            
            bill = Bill(quantity: quantity, price: price)
            
            let destinationController = segue.destination as! CartTableViewController
            destinationController.drinkCart = drink
            destinationController.bill = bill
//            destinationController.bills = bills
        }
    }
}
