//
//  SettingViewController.swift
//  RIVA
//
//  Created by hong qiu on 2016-01-07.
//  Copyright (c) 2016 Simon Fraser Univerity. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // MARK: - Logout action
    @IBAction func logOutTapped(sender: UIButton) {
        var alert = UIAlertController(title: "Logout", message: "Do you want to log out?", preferredStyle: UIAlertControllerStyle.Alert)
        // logout button
        var okAction = UIAlertAction(title: "OK", style: .Default, handler: ({ action -> Void in
            PFUser.logOut()
            self.performSegueWithIdentifier("gotoLogin", sender: nil)
        }))
        // cancel button
        var cancelAction = UIAlertAction(title: "Cancel", style: .Cancel){ action -> Void in
        
        }
        // add action to alert
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
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
