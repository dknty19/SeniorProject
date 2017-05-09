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
//        if externalUid != nil {
//            let logoutBtn = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(signoutButtonPressed(_:)))
//            navigationItem.rightBarButtonItem = logoutBtn
//            
//            let showBillBtn = UIButton(frame: CGRect(x: 45.0, y: 145.0, width: 46.0, height: 30.0))
//            showBillBtn.addTarget(self, action: #selector(showBill(_:)), for: .touchUpInside)
//            showBillBtn.setTitle("Show Bill", for: .normal)
//            showBillBtn.backgroundColor = UIColor.green
//            self.view.addSubview(showBillBtn)
//        }else {
//            let loginBtn = UIButton(frame: CGRect(x: 45.0, y: 175.0, width: 46.0, height: 30.0))
//            loginBtn.addTarget(self, action: #selector(performSegueInLogoutVC), for: .touchUpInside)
//            loginBtn.backgroundColor = UIColor.green
//            loginBtn.setTitle("Login", for: .normal)
//            
//            let register = UIButton(frame: CGRect(x: 45.0, y: 205.0, width: 46.0, height: 30.0))
//            register.backgroundColor = UIColor.green
//            register.setTitle("Register", for: .normal)
//            self.view.addSubview(loginBtn)
//            self.view.addSubview(register)
//            
//        }
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
    
    func performSegueInLogoutVC() {
        performSegue(withIdentifier: "login", sender: self)
    }
    
    // - MARK: IBAction
    
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
