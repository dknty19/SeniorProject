//
//  FoodDetailTableViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 4/3/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class FoodDetailTableViewController: UIViewController {
    
    @IBOutlet var foodImageView:UIImageView!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var increLabel:UILabel!
    @IBOutlet weak var priceLabel:UILabel!
    @IBOutlet weak var totalLabel:UILabel!

    var food:Food!
    var drink:Drink!
    var cart:Cart!
    
    var defaultQuantity = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // title for navigation
        title = food.name
        
        if let imageURL = URL.init(string: food.imageURL) {
            foodImageView.downloadedFrom(url: imageURL)
        }
        descriptionTextField.text = food.name
        //        cell.descriptionTextField.text = String(food.price)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFoodToLabel(_ sender: UIButton) {
        defaultQuantity += 1
        increLabel.text = "\(defaultQuantity)"

        totalLabel.text = String(defaultQuantity * food.price)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addFoodToCart" {
            let destinationController = segue.destination as! CartTableViewController
            
            let table = tableNumber
            let quantity = Int(increLabel.text!)!
            let price = Int(totalLabel.text!)!
            let name = food.name
            let date = String(describing: Date())
            
            cart = Cart(table: table, name: name, quantity: quantity, price: price, date: date)
            superCart.append(cart)
            
            
            destinationController.drinkCart = drink
            destinationController.foodCart = food
            destinationController.cart = cart
            //destinationController.bills = bills
        }
    }


    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }

}
