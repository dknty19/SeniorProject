//
//  DessertTableViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/21/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class DessertTableViewController: UITableViewController {

    var desserts:[Dessert] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = FIRDatabase.database().reference(withPath: "Restaurant/Desserts")
        
        //remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: nil, action: nil)
        
        //add data to firebase
        ref.queryOrdered(byChild: "name").observe(.value, with: { snapshot in
            var newDesserts: [Dessert] = []
            
            for item in snapshot.children {
                let dessert = Dessert(snapshot: item as! FIRDataSnapshot)
                newDesserts.append(dessert)
            }
            
            self.desserts = newDesserts
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return desserts.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DessertTableViewCell
        
        let dessertItem = desserts[indexPath.row]
        cell.nameDesertLabel.text = dessertItem.name
        cell.priceDesertLabel.text = String(dessertItem.price)
        if let imageURL = URL.init(string: dessertItem.imageURL) {
            cell.desertImageView.downloadedFrom(url: imageURL)
        }
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
