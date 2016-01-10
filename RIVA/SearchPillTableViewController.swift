//
//  SearchPillTableViewController.swift
//  RIVA
//
//  Created by hong qiu on 2016-01-09.
//  Copyright (c) 2016 Simon Fraser Univerity. All rights reserved.
//

import UIKit

class SearchPillTableViewController: UITableViewController, UISearchResultsUpdating {

    var pillWholeArray:[String]?
    var filterPillArray = [String]()
    var resultSearchController = UISearchController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // read text file
        var error: NSError?
        var array: [String]?
        let path = NSBundle.mainBundle().pathForResource("myPill", ofType: "txt")
        let string = String(contentsOfFile: path!, encoding:NSASCIIStringEncoding, error: &error)
        if let theError = error {
            print("\(theError.localizedDescription)")
        }
        else {
            pillWholeArray = string!.componentsSeparatedByCharactersInSet(.newlineCharacterSet())
        }
        
        
        // Build searchbar
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if self.resultSearchController.active{
            return filterPillArray.count
        }
        else {
            return 0
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as!UITableViewCell

        if self.resultSearchController.active {
            cell.textLabel?.text = self.filterPillArray[indexPath.row]
        }

        return cell
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        self.filterPillArray.removeAll(keepCapacity: false)
        
        self.filterPillArray = self.pillWholeArray?.filter{ pill in
            return pill.lowercaseString.rangeOfString(searchController.searchBar.text) != nil
            } ?? []
        
        self.tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("setPillTime", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let destination = segue.destinationViewController as? PillSetTimeViewController{
            destination.pill = self.filterPillArray[self.tableView.indexPathForSelectedRow()!.row]
        }
    }
}
