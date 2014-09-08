//
//  LoginViewController.swift
//  Tumblr
//
//  Created by Sam Jau on 9/8/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true;
    }

    @IBAction func onCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(false, completion: nil)
    }


}
