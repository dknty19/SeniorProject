//
//  WalkthroughPageViewController.swift
//  Test
//
//  Created by Vinh (Vern) H. NGUYEN on 3/17/17.
//  Copyright (c) 2017 Vinh (Vern) H. NGUYEN. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    var pageHeadings = ["Personalize", "Location", "Discover"]
    var pageImages = ["foodpin-intro-1", "foodpin-intro-2", "foodpin-intro-2"]
    var pageContents = ["Pin your favorite Restaurants and creat your own food guide",
    "Search and locate your favorite restaurant on map",
    "Find the restaurants pinned by your friend and others around the world"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set data source to itself
        dataSource = self
        
        //create first walkthrough screen
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        //create a new view controller and pass suitable data
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.content = pageContents[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        return nil
    }
    
    func forward(_ index: Int) {
        if let nextViewController = contentViewController(at: index + 1) {
            setViewControllers([nextViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        }
    }
    
//    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//        return pageHeadings.count
//    }
//    
//    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//        if let pageContentViewController = storyboard?.instantiateViewControllerWithIdentifier("WalkthroughContentViewController") as? WalkthroughContentViewController {
//            
//            return pageContentViewController.index
//        }
//        return 0
//    }
    
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
