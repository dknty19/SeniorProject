//
//  CheckOutViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/24/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CheckOutViewController: UIViewController {
    
    let refCart = FIRDatabase.database().reference(withPath: "Restaurant/Carts/")
    let refBill = FIRDatabase.database().reference(withPath: "Restaurant/Bills/")
    
//    @IBOutlet var tableTextField:UITextField!
    @IBOutlet var totalTextField:UITextField!
//
    var checkOut = [Cart]()
    var bill = [Bill]()
    var total = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if checkOut.count == 0 {
            totalTextField.text = String(total)
        }else {
            for i in 0...checkOut.count - 1 {
                total += checkOut[i].price
            }
            totalTextField.text = String(total)
        }
        
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
        if checkOut.count == 0 {
            let alertController = UIAlertController(title: "Warning!", message: "There is nothing to purchase. Please come back and choose one item.", preferredStyle: .alert)
            let defautlAction = UIAlertAction(title: "OK", style: .default, handler: nil
//                { _ in                self.dismiss(animated: true, completion: nil)}
            )
            alertController.addAction(defautlAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            let alerController1 = UIAlertController(title:"Payment", message: "Your meal will be available soon! Have a good meal!", preferredStyle: .alert)
            let defautlAction1 = UIAlertAction(title: "OK", style: .default, handler: { _ in
                
                let idBill = self.refBill.childByAutoId().key
                
                for i in 0...(self.checkOut.count - 1) {
//                    let uid = self.checkOut[i].uid
                    let id = self.refCart.childByAutoId().key
//                    let table = self.checkOut[i].table
                    let name = self.checkOut[i].name
                    let price = self.checkOut[i].price
//                    let isPay = self.checkOut[i].isPay
                    let image = self.checkOut[i].image
                    let quantity = self.checkOut[i].quantity
                    let date = self.checkOut[i].date
                    
                    // add data
                    let cartItem = Cart(id: id, idBill:idBill, name: name, quantity: quantity, price: price, image: image, date: date)
                    
                    //add note child to cart
                    let cartItemRef = self.refCart.child(id)
                    
                    //
                    cartItemRef.setValue(cartItem.toAnyObject())
                    
                }
                let billItem = Bill(id: idBill, uid: externalUid!, isPay: false, table: tableNumber, total:self.total)
                //add note child to bill
                let billItemRef = self.refBill.child(idBill)
                billItemRef.setValue(billItem.toAnyObject())
                
                //remove supercart after submit cart
                superCart.removeAll()
            })
            alerController1.addAction(defautlAction1)
            self.present(alerController1, animated: true, completion: nil)
        }
    }
}
