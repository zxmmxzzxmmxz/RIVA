//
//  LogInViewController.swift
//  RIVA
//
//  Created by hong qiu on 2016-01-07.
//  Copyright (c) 2016 Simon Fraser Univerity. All rights reserved.
//

import UIKit
import Parse

class LogInViewController: UIViewController, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
//        self.actInd.center = self.view.center
//        self.actInd.hidesWhenStopped = true
//        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
//        view.addSubview(self.actInd)
        userTextField.delegate = self
        passwordTextField.delegate = self
    }

    
    // MARK: - LogIn variables
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var actInd:UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
    
    
    // MARK: - LogIn action
    @IBAction func logInTapped(sender: UIButton) {
        
        var username = userTextField.text
        var password = passwordTextField.text
        
        // check if text is empty
        if password.isEmpty || username.isEmpty {
            // show alert
            var alert:UIAlertView = UIAlertView(title: "LogIn failed", message: "Username or password is empty", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        // login action
        else {
            PFUser.logInWithUsernameInBackground(username, password: password, block: { (user, error) -> Void in
                // if login seccessful
                if user != nil {
                    self.performSegueWithIdentifier("gotoView", sender: nil)
                }// if fail
                else if let error = error {
                    self.showErrorView(error)
                }
            
            })
        }
        // keyboard go away when tap button
        self.passwordTextField.resignFirstResponder()
    }
    
    // inherit from UIViewController, tap blank to return keyboard
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if PFUser.currentUser() != nil {
            self.performSegueWithIdentifier("gotoView", sender: nil)
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
