//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Sam Jau on 9/7/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning{
    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var addLinkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var isPresenting: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = UIModalPresentationStyle.Custom
        transitioningDelegate = self
    }
    
    @IBAction func onDismissButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationViewController = segue.destinationViewController as UIViewController
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
//        destinationViewController.transitioningDelegate = self
    }
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.4
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView() as UIView
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as UIViewController!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)as UIViewController!
        if (isPresenting == true) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            textButton.center.y = 700
            photoButton.center.y = 700
            quoteButton.center.y = 700
            addLinkButton.center.y = 700
            chatButton.center.y = 700
            videoButton.center.y = 700
            println("presenting")
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.removeFromParentViewController()
            }
            UIView.animateWithDuration(0.2, delay: 0.2, options: nil, animations: {
                self.photoButton.center.y = 192
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.25, options: nil, animations: {
                self.chatButton.center.y = 323
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.27, options: nil, animations: {
                self.quoteButton.center.y = 192
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.3, options: nil, animations: {
                self.textButton.center.y = 192
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.32, options: nil, animations: {
                self.videoButton.center.y = 323
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.35, options: nil, animations: {
                self.addLinkButton.center.y = 323
                }, completion: nil)

        } else {
            println("not pres")
            UIView.animateWithDuration(0.2, delay: 0.2, options: nil, animations: {
                self.photoButton.center.y = -100
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.25, options: nil, animations: {
                self.chatButton.center.y = -100
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.27, options: nil, animations: {
                self.quoteButton.center.y = -100
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.3, options: nil, animations: {
                self.textButton.center.y = -100
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.32, options: nil, animations: {
                self.videoButton.center.y = -100
                }, completion: nil)
            UIView.animateWithDuration(0.2, delay: 0.35, options: nil, animations: {
                self.addLinkButton.center.y = -100
                }, completion: nil)
            
            UIView.animateWithDuration(0.4, delay: 0.3, options: nil, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    fromViewController.view.removeFromSuperview()
                    transitionContext.completeTransition(true)
            }

        }
    }
}
