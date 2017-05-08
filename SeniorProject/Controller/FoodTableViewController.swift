//
//  FoodTableViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 4/3/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class FoodTableViewController: UITableViewController {
    
    var foods: [Food] = []
    let ref = FIRDatabase.database().reference(withPath: "Restaurant/Foods")
//    var user:User!
//    let usersRef = FIRDatabase.database().reference(withPath: "Restaurant/Users")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
    
        //user
//        FIRAuth.auth()!.addStateDidChangeListener { auth, user in
//            guard let user = user else { return }
//            self.user! = User(authData: user)
//            let currentUserRef = self.usersRef.child(self.user.uid)
//            currentUserRef.setValue(self.user.email)
//            currentUserRef.onDisconnectRemoveValue()
//        }

        //food
        ref.queryOrdered(byChild: "name").observe(.value, with: { snapshot in
            var newFoods: [Food] = []
            
            for item in snapshot.children {
                let food = Food(snapshot: item as! FIRDataSnapshot)
                newFoods.append(food)
            }
            
            self.foods = newFoods
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\(tableID)" + " idtable")
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
        
        let foodItem = foods[indexPath.row]
        cell.nameFoodLabel.text = foodItem.name
        cell.priceFoodLabel.text = String(foodItem.price)
        if let imageURL = URL.init(string: foodItem.imageURL) {
            cell.foodImageView.downloadedFrom(url: imageURL)
        }
        
        return cell
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFoodDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
//                let naviController = segue.destination as! UINavigationController
                let destinationController = segue.destination as! FoodDetailTableViewController
                destinationController.food = foods[indexPath.row]
                destinationController.hidesBottomBarWhenPushed = false
            }
        }
    }
    //MARK: -Action
    
    @IBAction func backToFoodTableViewController(_ segue: UIStoryboardSegue) {}
}



    // extension for download image from url
extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { () -> Void in
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
