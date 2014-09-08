//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Sam Jau on 9/6/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var homeButton: UIButton!
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var composeViewController : UIViewController!
    var settingsViewController : UIViewController!
    var trendingViewController : UIViewController!
    var currentViewController : UIViewController!
    var currentButton : UIButton!
    
    @IBOutlet weak var explorePopImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        settingsViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        contentView.addSubview(homeViewController.view)
        currentButton = homeButton
        currentButton.selected = true
        popOverBob()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func popOverBob(){
        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.Autoreverse, animations: {
            self.explorePopImageView.center.y = self.explorePopImageView.center.y + 8
        }, completion: nil)
    }
    
    @IBAction func onTabBarButton(sender: AnyObject) {
        var button = sender as UIButton
        
        if button.tag == 0 {
            println(button.tag)
            switchTab(homeViewController, button: button)
        } else if button.tag == 1 {
            println(button.tag)
            switchTab(searchViewController, button: button)
            explorePopImageView.alpha = 0
            button.selected = true
        } else if button.tag == 2 {
            println(button.tag)
//            switchTab(composeViewController)
        } else if button.tag == 3 {
            println(button.tag)
            button.selected = true
            switchTab(settingsViewController, button: button)
        } else if button.tag == 4 {
            println(button.tag)
            button.selected = true
            switchTab(trendingViewController, button: button)
        }
    }
    
    func switchTab(tabView : UIViewController, button : UIButton!){
        explorePopImageView.alpha = 1
        currentButton.selected = false
        button.selected = true
        contentView.addSubview(tabView.view)
        self.addChildViewController(tabView)
        tabView.didMoveToParentViewController(self)
        currentViewController = tabView
        currentButton = button
    }
}
