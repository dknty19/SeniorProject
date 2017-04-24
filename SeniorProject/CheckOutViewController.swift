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
    var total = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...checkOut.count - 1 {
            total += checkOut[i].price * checkOut[i].quantity
        }
        
        tableTextField.text = tableNumber
        totalTextField.text = String(total)
        
        
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
            let uid = checkOut[i].uid
            let table = checkOut[i].table
            let name = checkOut[i].name
            let price = checkOut[i].price
            let isPay = checkOut[i].isPay
            let image = checkOut[i].image
            let quantity = checkOut[i].quantity
            let date = checkOut[i].date
            
            // add data
            let cartItem = Cart(uid: uid, table: table, name: name, quantity: quantity, price: price, image: image, isPay:isPay, date: date)
            
            //add note child
            let cartItemRef = self.ref.child(date)
            
            //
            cartItemRef.setValue(cartItem.toAnyObject())
        }
        //            performSegue(withIdentifier: "addFinish", sender: self)
        }
}
