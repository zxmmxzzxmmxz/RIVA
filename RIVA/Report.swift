//
//  File.swift
//  Rivo
//
//  Created by Ximin Zhang on 1/6/16.
//  Copyright (c) 2016 Simon Fraser Univerity. All rights reserved.
//

import Foundation

class Report:PFObject, PFSubclassing{
    @NSManaged var sleepingpoints: NSArray
    @NSManaged var user: PFUser
    
    class func parseClassName() -> String {
        return "Report"
    }
    
    override class func initialize(){
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken){
            self.registerSubclass()
        }
    }
    
    override class func query() -> PFQuery? {
        let query = PFQuery(className: Report.parseClassName())
        query.includeKey("user")
        query.orderByDescending("createdAt")
        return query
    }
    
    init(points:NSArray){
        super.init()
        self.sleepingpoints = points
        self.user = PFUser.currentUser()!
    }
    
    override init(){
        super.init()
    }
}