    //
//  WalkthroughContentViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/17/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    @IBOutlet var headingLabel:UILabel!
    @IBOutlet var contentImageView:UIImageView!
    @IBOutlet var contentLabel:UILabel!
    @IBOutlet var pageControl:UIPageControl!
    @IBOutlet var nextButton:UIButton!

    var index = 0
    var heading = ""
    var imageFile = ""
    var content = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headingLabel.text = heading
        contentLabel.text = content
        contentImageView.image = UIImage(named: imageFile)
        pageControl.currentPage = index
        
        switch index{
        case 0...1: nextButton.setTitle("NEXT", for: UIControlState())
        case 2: nextButton.setTitle("DONE", for: UIControlState())
        default: break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        switch index{
        case 0...1:
            let pageViewController = parent as! WalkthroughPageViewController
            pageViewController.forward(index)
        case 2:
            UserDefaults.standard.set(true, forKey: "hasViewed")
            dismiss(animated: true, completion: nil)
            print("====")
        default: break
        }
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
