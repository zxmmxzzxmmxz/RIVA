//
//  SignUpViewController.swift
//  RIVA
//
//  Created by hong qiu on 2016-01-07.
//  Copyright (c) 2016 Simon Fraser Univerity. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController, UITextFieldDelegate{
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        userTextField.delegate = self
        passwordTextField.delegate = self
        confirmTextField.delegate = self
    }

    // MARK: - SignUp variable
    
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    
    
    
    // MARK: - SignUp action
    @IBAction func signUpTapped(sender: UIButton) {
        // initialize user account with Parse
        let newUser = PFUser()
        
        newUser.username = userTextField.text
        newUser.password = passwordTextField.text
        
        var password = passwordTextField.text
        var confirmpassword = confirmTextField.text
        var username = userTextField.text
        
        // text field is empty
        if password.isEmpty || confirmpassword.isEmpty || username.isEmpty {
            // show alert
            var alert:UIAlertView = UIAlertView(title: "SignUp failed", message: "Username or password is empty", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        // passwords do not match
        else if password != confirmpassword {
            var alert:UIAlertView = UIAlertView(title: "SignUp failed", message: "passwords do not match", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        // user name & password meet requirement
        else {
            newUser.signUpInBackgroundWithBlock({ succeeded, error in
                if (succeeded) {
                    // registeration was successful, back to login
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                else if let error = error {
                    self.showErrorView(error)
                }
            })
        }
        // keyboard go away when tap button
        self.confirmTextField.resignFirstResponder()
    }
    
    // inherit from UIViewController
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }
    
    // keyboard go away when tap return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
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
