//
//  LoginViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/27/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: -Login
    
    @IBAction func login(_ sender: UIButton) {
        if self.usernameTextField.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            print("Cannot login 1")
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.usernameTextField.text!, password: self.passwordTextField.text!) { (user, error) in
            
                if error == nil {
                    
                    //Go to the HomeViewController if the login is sucessful
                    externalUid = user?.uid
                    print(externalUid! + "in loginVC")
                    self.performSegue(withIdentifier: "login", sender: self)
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
//                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    print("-------Cannot login 1-------")
                }
            }
        }
    }
    
    @IBAction func login2(_ sender: UIButton) {
        if self.usernameTextField.text == "" || self.passwordTextField.text == "" {
            
            //Alert to tell the user that there was an error because they didn't fill anything in the textfields because they didn't fill anything in
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an email and password.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            self.present(alertController, animated: true, completion: nil)
            print("Cannot login 2")
            
        } else {
            
            FIRAuth.auth()?.signIn(withEmail: self.usernameTextField.text!, password: self.passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    //Go to the HomeViewController if the login is sucessful
                    externalUid = user?.uid
                    print(externalUid! + "in loginVC")
                    
                    //check if there is cart or not
                    if superCart.count != 0 {
                        self.performSegue(withIdentifier: "Payment", sender: self)
                    //                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
                    //                    self.present(vc!, animated: true, completion: nil)
                    }else {
                        self.performSegue(withIdentifier: "login", sender: self)
                    }
                    
                } else {
                    
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                    print("-------Cannot login 2-------")
                }
            }
        }
    }
    
    @IBAction func signUpAccount(_ sender: UIButton) {
        if usernameTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.createUser(withEmail: usernameTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    let alertController = UIAlertController(title: "Congratulations", message: "You have signed up successfully!", preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    //Goes to the Setup page which lets the user take a photo for their
                    self.performSegue(withIdentifier: "register", sender: self)
                    
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

