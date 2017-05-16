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
    let refUser = FIRDatabase.database().reference()
    
//    @IBOutlet var tableTextField:UITextField!
    @IBOutlet var totalTextField:UITextField!
//
//    var checkOut = [Cart]()
    var bill = [Bill]()
    var total = 0
    var dateTime = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if superCart.count == 0 {
            totalTextField.text = String(total)
        }else {
            for i in 0...superCart.count - 1 {
                total += superCart[i].price
            }
            totalTextField.text = String(total) + " $"
        }
        changeDate()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "barrafina.png")!)
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
        if superCart.count == 0 {
            let alertController = UIAlertController(title: "Warning!", message: "There is nothing to purchase. Please come back and choose one item.", preferredStyle: .alert)
            let defautlAction = UIAlertAction(title: "OK", style: .default, handler: nil
//                { _ in                self.dismiss(animated: true, completion: nil)}
            )
            alertController.addAction(defautlAction)
            self.present(alertController, animated: true, completion: nil)
        }else
            {
            if externalUid == nil {
                let alerController1 = UIAlertController(title:"Payment", message: "Are you sure?", preferredStyle: .alert)
                let defautlAction1 = UIAlertAction(title: "Yes", style: .default, handler: { _ in
                    
                    let idBill = self.refBill.childByAutoId().key
                    externalUid = self.refUser.childByAutoId().key
                    
                    for i in 0...(superCart.count - 1) {
                        let id = self.refCart.childByAutoId().key
                        let name = superCart[i].name
                        let price = superCart[i].price
                        let image = superCart[i].image
                        let quantity = superCart[i].quantity
                        
                        // add data
                        let cartItem = Cart(id: id, idBill:idBill, name: name, quantity: quantity, price: price, image: image)
                        
                        //add note child to cart
                        let cartItemRef = self.refCart.child(idBill).child(id)
                        
                        //
                        cartItemRef.setValue(cartItem.toAnyObject())
                    }
                    
                    let billItem = Bill(id: idBill, uid: externalUid!, isPay: false, table: tableID!, total: self.total, date: self.dateTime)
                    
                    //add note child to bill
                    let billItemRef = self.refBill.child(idBill)
                    billItemRef.setValue(billItem.toAnyObject())
                    
                    //remove supercart after submit cart
                    superCart.removeAll()
                    
                    let alertController2 = UIAlertController(title: "Thank you!", message: "We will bring your meal soon. \nHave a nice meal!", preferredStyle: .alert)
                    let defaulAction2 = UIAlertAction(title: "OK", style: .default, handler: { _ in
                        let newRootViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainHome")
                        UIApplication.shared.keyWindow?.rootViewController = newRootViewController
                    })
                    alertController2.addAction(defaulAction2)
                    self.present(alertController2, animated: true, completion: nil)
                })
                
                let cancelAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
                alerController1.addAction(defautlAction1)
                alerController1.addAction(cancelAction)
                self.present(alerController1, animated: true, completion: nil)
            }else {
                
                let alerController1 = UIAlertController(title:"Payment", message: "Are you sure?", preferredStyle: .alert)
                let defautlAction1 = UIAlertAction(title: "OK", style: .default, handler: { _ in
                    
                    let idBill = self.refBill.childByAutoId().key
                    
                    for i in 0...(superCart.count - 1) {
                        let id = self.refCart.childByAutoId().key
                        let name = superCart[i].name
                        let price = superCart[i].price
                        let image = superCart[i].image
                        let quantity = superCart[i].quantity
                        
                        // add data
                        let cartItem = Cart(id: id, idBill:idBill, name: name, quantity: quantity, price: price, image: image)
                        
                        //add note child to cart
                        let cartItemRef = self.refCart.child(idBill).child(id)
                        
                        //
                        cartItemRef.setValue(cartItem.toAnyObject())
                        
                    }
                    let billItem = Bill(id: idBill, uid: externalUid!, isPay: false, table: tableID!, total:self.total, date:self.dateTime)
                    
                    //add note child to bill
                    let billItemRef = self.refBill.child(idBill)
                    billItemRef.setValue(billItem.toAnyObject())
                    
                    //remove supercart after submit cart
                    superCart.removeAll()
                    
                    let alertController2 = UIAlertController(title: "Thank you!", message: "We will bring your meal soon. \nHave a nice meal!", preferredStyle: .alert)
                    let defaulAction2 = UIAlertAction(title: "OK", style: .default, handler: { _ in
                        let newRootViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainHome")
                        UIApplication.shared.keyWindow?.rootViewController = newRootViewController
                    })
                    alertController2.addAction(defaulAction2)
                    self.present(alertController2, animated: true, completion: nil)
                })
                
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alerController1.addAction(defautlAction1)
            alerController1.addAction(cancelAction)
            self.present(alerController1, animated: true, completion: nil)
            }
        }
    }
    
    func changeDate() {
        let date = Date()
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        dateTime = "\(day)-\(month)-\(year) \(hour)h:\(minutes)'"
    }
}
