//
//  ReviewViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/21/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit


class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView:UIImageView!
    @IBOutlet var restaurantImageView:UIImageView!
    
    var restaurant:Restaurant!
    override func viewDidLoad() {
        super.viewDidLoad()

        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        //passing data image from restaurant detail
        if let restaurant = restaurant {
            restaurantImageView.image = UIImage(named: restaurant.image!)
        }
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

}
