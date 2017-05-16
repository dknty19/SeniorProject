//
//  ChangePasswordViewController.swift
//  SeniorProject
//
//  Created by Vinh (Vern) H. NGUYEN on 5/15/17.
//  Copyright © 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit
import Firebase

class ChangePasswordViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField:UITextField!
    @IBOutlet weak var warningLabel:UILabel!
    
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
    
    @IBAction func ChangePassword(_ segue: UIStoryboardSegue) {
        
        if passwordTextField.text! == confirmPasswordTextField.text! {
            FIRAuth.auth()?.currentUser?.updatePassword(passwordTextField.text!, completion: { (error) in
                if error == nil {
                    let alertController = UIAlertController(title: "Successful!", message: "Your password is already updated", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                        self.dismiss(animated: true, completion: nil)
                    })
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: { _ in
                        self.dismiss(animated: true, completion: nil)
                    })
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            })
        }else {
            warningLabel.text = "Password is not match the confirm password"
        }
    }

}
