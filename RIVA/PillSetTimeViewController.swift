//
//  PillSetTimeViewController.swift
//  RIVA
//
//  Created by Ximin Zhang on 2016-01-09.
//  Copyright (c) 2016 Simon Fraser Univerity. All rights reserved.
//

import UIKit

class PillSetTimeViewController: UIViewController {

    @IBOutlet weak var datepicker: UIDatePicker!
    
    var pill:String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ok(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Add Notification", message: "Would you like to create a notification for this pill?", preferredStyle: UIAlertControllerStyle.Alert)
        let OKAction = UIAlertAction(title: "Yes", style: .Default) { (action:UIAlertAction!) in
            let localNotification = UILocalNotification()
            let date = self.datepicker.date
            localNotification.fireDate = date
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.alertAction = "OK"
            let message = self.pill?.componentsSeparatedByString(",")[2] ?? ""
            localNotification.alertBody = "Time to take the pill:\(message)"
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
            self.performSegueWithIdentifier("setpilltimetolist", sender: self)
        }
        alert.addAction(OKAction)
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.Default){(action:UIAlertAction!)in
                self.performSegueWithIdentifier("setpilltimetolist", sender: self)
            })
        presentViewController(alert, animated: true, completion: nil)
    }

}
