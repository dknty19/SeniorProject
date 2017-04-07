//
//  RestaurantDetailViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/21/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class DrinkDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var drinkImageView:UIImageView!
    @IBOutlet var tableView:UITableView!
    
    var drink:Drink!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drinkImageView.image = UIImage(named: drink.image)
        
        //background color in table view
        tableView.backgroundColor = UIColor(red: 225.0/255.0, green: 85.0/255.0, blue: 80.0/255.0, alpha: 0.2)
        
        //title nav bar
        title = drink.name
        print("\(title)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DrinkDetailTableViewCell
        
        cell.descriptionTextField.text = drink.type
        cell.labelNameDrink.text = drink.name
        cell.backgroundColor = UIColor(red: 225.0/255.0, green: 110.0/255, blue: 85.0/255, alpha: 0.8)
        
        return cell
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
    
    /*
    // MARK: - Navigation
    
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

}
