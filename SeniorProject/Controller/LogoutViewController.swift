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
    
    let resRef = FIRDatabase.database().reference(withPath: "Restaurants/Image")
    var billID: [Cart] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if FIRAuth.auth()?.currentUser != nil {
            
            let changePassBtn = UIButton(type: UIButtonType.system)
            changePassBtn.frame = CGRect(x: 43, y: 110, width: 140, height: 30)
            changePassBtn.addTarget(self, action: #selector(changePassword), for: .touchUpInside)
            changePassBtn.setTitle("Change Password", for: .normal)
            
            let showBillBtn = UIButton(type: UIButtonType.system)
            showBillBtn.frame = CGRect(x: 46, y: 150, width: 100, height: 30)
            showBillBtn.addTarget(self, action: #selector(showBill(_:)), for: .touchUpInside)
            showBillBtn.setTitle("Order History", for: .normal)
            self.view.addSubview(showBillBtn)
            
            if tableID == nil {
                let scanBtn = UIButton(type: UIButtonType.system)
                scanBtn.frame = CGRect(x: 43, y: 70, width: 50, height: 30)
                scanBtn.addTarget(self, action: #selector(showScan), for: .touchUpInside)
                scanBtn.setTitle("Scan", for: .normal)
                    
                self.view.addSubview(scanBtn)
            }
            
            self.view.addSubview(changePassBtn)
            
        }else
            if externalUid != nil {
                let showBillBtn = UIButton(type: UIButtonType.system)
                showBillBtn.frame = CGRect(x: 43, y: 150, width: 100, height: 30)
                showBillBtn.addTarget(self, action: #selector(showBill(_:)), for: .touchUpInside)
                showBillBtn.setTitle("Order History", for: .normal)
                self.view.addSubview(showBillBtn)
                
                let loginBtn = UIButton(type: UIButtonType.system)
                loginBtn.frame = CGRect(x: 43, y: 110, width: 46, height: 30)
                loginBtn.addTarget(self, action: #selector(showLoginScreen), for: .touchUpInside)
                loginBtn.setTitle("Login", for: .normal)
                
                self.view.addSubview(loginBtn)
            }else{
                let loginBtn = UIButton(type: UIButtonType.system)
                loginBtn.frame = CGRect(x: 43, y: 110, width: 46, height: 30)
                loginBtn.addTarget(self, action: #selector(showLoginScreen), for: .touchUpInside)
                loginBtn.setTitle("Login", for: .normal)
                
                self.view.addSubview(loginBtn)
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
    
    func showLoginScreen() {
        performSegue(withIdentifier: "login", sender: self)
    }
    
    func changePassword() {
        performSegue(withIdentifier: "changePassword", sender: self)
    }
    
    func showScan() {
        performSegue(withIdentifier: "showScan", sender: self)
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
        performSegue(withIdentifier: "ShowBill", sender: self)
    }
    
    @IBAction func back(_ segue: UIStoryboardSegue){}
    
    @IBAction func sharing(_ sender: AnyObject) {
        let defaultText = "Just checking in at Restaurant"
        if let imageToShare = UIImage(named: "imageRestaurant") {
        let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            self.present(activityController, animated: true, completion: nil)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "orderHistory" {
//            let destinationViewController = segue.destination as! OrderHistoryTableViewController
//            destinationViewController.orderHistory = billID
//        }
//    }
}
