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
//    @IBOutlet var nameDrinkLabel:UILabel!
    
    var defaultQuantity = 1
//    var total = 0
    
    var cart:Cart!
    var carts = [Cart]()
    var drink:Drink!
    var food:Food!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //background color in table view
//        tableView.backgroundColor = UIColor(red: 225.0/255.0, green: 85.0/255.0, blue: 80.0/255.0, alpha: 0.2)
        
        //title nav bar
        title = drink.name
        
        if let imageURL = URL.init(string: drink.imageURL) {
            drinkImageView.downloadedFrom(url: imageURL)
        }
        descriptionTextField.text = drink.type
        increLabel.text = String(defaultQuantity)
        priceLabel.text = String(drink.price)
        totalTextField.text = String(drink.price)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
//        navigationController?.hidesBottomBarWhenPushed = true
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
    
    @IBAction func addDrinkToLabel(_ sender: UIButton) {
        defaultQuantity += 1
        increLabel.text = "\(defaultQuantity)"
        
        totalTextField.text = String(defaultQuantity * drink.price)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationController = segue.destination as! CartTableViewController
        if segue.identifier == "addDrinkToCart" {
            
            let uid = externalUid!
            let id = ""
            let table = tableNumber
            let name = drink.name
            let quantity = Int(increLabel.text!)!
            let price = Int(totalTextField.text!)!
            let image = drink.imageURL
            let isPay = false
            let date = String(describing: Date())
            
            cart = Cart(uid: uid, id: id, table: table, name: name, quantity: quantity, price: price, image: image, isPay: isPay, date: date)
            superCart.append(cart)
            
            
            destinationController.cart = cart
//            destinationController.drinkCart = drink
            //destinationController.bills = bills
        }
        
        if segue.identifier == "showCart" {
            destinationController.cart = cart
//            destinationController.drinkCart = drink
//            destinationController.foodCart = food
            //destinationController.bills = bills
        }
    }
}
