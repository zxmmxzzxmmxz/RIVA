//
//  File.swift
//  RIVA
//
//  Created by Ximin Zhang on 2016-01-09.
//  Copyright (c) 2016 Simon Fraser Univerity. All rights reserved.
//

import Foundation
class pill{
    var Number:String?
    var DIN:String?
    var Name:String?
    var shouldTakenDate:NSDate?
    init(drugNumber:String,dinNumber:String,drugName:String){
        Number = drugNumber
        DIN = dinNumber
        Name = drugName
    }
    
    func updateDate(date:NSDate){
        shouldTakenDate = date
    }
    
    func getShouldTakenDate()->NSDate?{
        return shouldTakenDate
    }
    
}