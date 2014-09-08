//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Sam Jau on 9/8/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchFeedImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
//        loadAnimate();
        delay(2){
            self.searchFeedImageView.hidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//    func loadAnimate(){
//        UIView.animateWithDuration(1, delay: 0, options: UIViewAnimationOptions.Repeat, animations: {
//            self.load1ImageView.alpha = 1
//            self.load2ImageView.alpha = 0
//            self.load3ImageView.alpha = 0
//            }, completion:{(finished:Bool) in
//                UIView.animateWithDuration(1, delay: 0.9, options: nil, animations:{
//                    self.load1ImageView.alpha = 0
//                    self.load2ImageView.alpha = 1
//                    self.load3ImageView.alpha = 0
//                }, completion:{(finished:Bool) in
//                    UIView.animateWithDuration(1, delay: 0.9, options: nil, animations:{
//                        self.load1ImageView.alpha = 0
//                        self.load2ImageView.alpha = 1
//                        self.load3ImageView.alpha = 0
//                    }, completion: nil)
//                })
//        })
//    }
//    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
