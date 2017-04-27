//
//  LogoutViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 4/26/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class LogoutViewController: UIViewController {
    
    
    var billID: [Cart] = []
    
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
    
    @IBAction func signoutButtonPressed(_ sender: AnyObject) {
        do {
            try FIRAuth.auth()!.signOut()
            dismiss(animated: true, completion: nil)
            superCart.removeAll()
            externalUid = nil
        } catch {
            
        }
    }
    
    @IBAction func showBill(_ sender: AnyObject) {
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "orderHistory" {
//            let destinationViewController = segue.destination as! OrderHistoryTableViewController
//            destinationViewController.orderHistory = billID
//            print(self.billID.count)
//        }
//    }
}
