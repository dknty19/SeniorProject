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
    var priceAfterMultiple = 0
    
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
        priceLabel.text = String(food.price)
        increLabel.text = String(defaultQuantity)
        totalLabel.text = String(food.price) + " $"
        priceAfterMultiple = food.price * defaultQuantity
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFoodToLabel(_ sender: UIButton) {
        defaultQuantity += 1
        increLabel.text = "\(defaultQuantity)"
        totalLabel.text = String(defaultQuantity * food.price) + " $"
        defaultQuantity = Int(increLabel.text!)!
        priceAfterMultiple = food.price * defaultQuantity
    }
    
    @IBAction func minusFoodToLabel(_ sender: UIButton) {
        if defaultQuantity > 1 {
            defaultQuantity -= 1
            increLabel.text = "\(defaultQuantity)"
            totalLabel.text = String(defaultQuantity * food.price) + " $"
            defaultQuantity = Int(increLabel.text!)!
            priceAfterMultiple = food.price * defaultQuantity
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addFoodToCart" {
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
                let name = self.food.name
                let quantity = Int(self.increLabel.text!)!
                let price = self.priceAfterMultiple
                let image = self.food.imageURL
                
                self.cart = Cart(id: id, idBill:"", name: name, quantity: quantity, price: price, image: image)
                superCart.append(self.cart)
                
                destinationController.cart = self.cart
            }
        }
    }


    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using [segue destinationViewController].
//        // Pass the selected object to the new view controller.
//    }

}
