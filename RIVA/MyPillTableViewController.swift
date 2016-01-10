//
//  MyPillTableViewController.swift
//  RIVA
//
//  Created by hong qiu on 2016-01-09.
//  Copyright (c) 2016 Simon Fraser Univerity. All rights reserved.
//

import UIKit

class MyPillTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, UIPopoverPresentationControllerDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var pilllist:[pill]=[]{
        didSet{
            self.tableView.reloadData()
        }
    }
    
    
    @IBAction func goBackToPillsList(segue:UIStoryboardSegue){
        if let source = segue.sourceViewController as? PillSetTimeViewController{
            if let newpill = source.pill{
                let singlepillinarray = newpill.componentsSeparatedByString(",")
                let singlepill = pill(drugNumber: singlepillinarray[0], dinNumber: singlepillinarray[1], drugName: singlepillinarray[2])
                singlepill.updateDate(source.datepicker.date)
                pilllist.append(singlepill)
            }
            //source.dismissViewControllerAnimated(true, completion: nil)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Add pill action
    
    @IBAction func searchPillTapped(sender: AnyObject) {
        self.performSegueWithIdentifier("gotoSearch", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotoSearch" {
            // set controller to searchViewTable
            var vc = segue.destinationViewController as! UITableViewController
            // go to searchViewTable
            var searchController = vc.popoverPresentationController
            
            if searchController != nil {
                searchController?.delegate = self
            }
        }
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return .None
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return pilllist.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as? UITableViewCell
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        }
        cell!.textLabel?.text = pilllist[indexPath.row].Name
        cell!.textLabel?.numberOfLines = 0
        if let date:NSDate = pilllist[indexPath.row].shouldTakenDate{
            let formatter = NSDateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            cell!.detailTextLabel?.text = formatter.stringFromDate(date)
            print("why nothing?! \(formatter.stringFromDate(date))")
        }
        print("here\n")
        return cell!
    }


    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            pilllist.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }

}
