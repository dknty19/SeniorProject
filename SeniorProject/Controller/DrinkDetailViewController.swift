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
    
    var defaultQuantity = 1
    var priceAfterMultiple = 0
    
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
        totalTextField.text = String(drink.price) + " $"
        priceAfterMultiple = drink.price * defaultQuantity
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
    
    @IBAction func addDrinkToLabel(_ sender: UIButton) {
        defaultQuantity += 1
        increLabel.text = "\(defaultQuantity)"
        totalTextField.text = String(defaultQuantity * drink.price) + " $"
        defaultQuantity = Int(increLabel.text!)!
        priceAfterMultiple = drink.price * defaultQuantity
    }
    
    @IBAction func minusDrinkToLabel(_ sender: UIButton) {
        if defaultQuantity > 1 {
            defaultQuantity -= 1
            increLabel.text = "\(defaultQuantity)"
            totalTextField.text = String(defaultQuantity * drink.price) + " $"
            defaultQuantity = Int(increLabel.text!)!
            priceAfterMultiple = drink.price * defaultQuantity
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addDrinkToCart" {
            let destinationController = segue.destination as! CartTableViewController
            
            if tableID == nil {
                let alertController = UIAlertController(title: "Warning!", message: "You need to scan before purchase.", preferredStyle: .alert)
                let defautlAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
                    
                    let newRootViewController = self.storyboard!.instantiateViewController(withIdentifier: "Scan")
                    UIApplication.shared.keyWindow?.rootViewController = newRootViewController
                })
                let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
                
                alertController.addAction(cancelAction)
                alertController.addAction(defautlAction)
                self.present(alertController, animated: true, completion: nil)
            }else {
                let id = ""
                let name = self.drink.name
                let quantity = Int(self.increLabel.text!)!
                let price = self.priceAfterMultiple
                let image = self.drink.imageURL
                
                self.cart = Cart(id: id, idBill:"", name: name, quantity: quantity, price: price, image: image)
                superCart.append(self.cart)
                
                destinationController.cart = self.cart
            }
        }
    }
}
