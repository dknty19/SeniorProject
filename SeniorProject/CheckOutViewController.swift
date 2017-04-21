//
//  CheckOutViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/20/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CheckOutViewController: UIViewController {

    let ref = FIRDatabase.database().reference(withPath: "Restaurant/Bills/Tables "+tableNumber)
    
    @IBOutlet var tableTextField:UITextField!
    @IBOutlet var totalTextField:UITextField!
    
    var checkOut = [Cart]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func checkOut(sender: UIButton!) {
        for i in 0...(checkOut.count - 1) {
            let table = checkOut[i].table
            let name = checkOut[i].name
            let price = checkOut[i].price
            let quantity = checkOut[i].quantity
            let date = checkOut[i].date
            
            // add data
            let cartItem = Cart(table: table, name: name, quantity: quantity, price: price, date: date)
            
            //add note child
            let cartItemRef = self.ref.child(date)
            
            //
            cartItemRef.setValue(cartItem.toAnyObject())
        }
        //            performSegue(withIdentifier: "addFinish", sender: self)
        }
}
