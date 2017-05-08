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
        
        let alertController = UIAlertController(title: "Logout", message: "Do you want to logout?", preferredStyle: .alert)
        let defaultAlert = UIAlertAction(title: "OK", style: .default, handler: { _ in
            do {
                try FIRAuth.auth()!.signOut()
                superCart.removeAll()
                externalUid = nil
                tableID = nil
                let newRootViewController = self.storyboard!.instantiateViewController(withIdentifier: "RootView")
                UIApplication.shared.keyWindow?.rootViewController = newRootViewController
            } catch {
                
            }
        })
        let cancelAlert = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(defaultAlert)
        alertController.addAction(cancelAlert)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func showBill(_ sender: AnyObject) {
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "orderHistory" {
//            let destinationViewController = segue.destination as! OrderHistoryTableViewController
//            destinationViewController.orderHistory = billID
//        }
//    }
}
