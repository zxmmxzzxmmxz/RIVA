//
//  SetUpAlarmViewController.swift
//  ToMorning-ximinz
//
//  Created by Ximin Zhang on 2015-11-06.
//  Copyright (c) 2015 CMPT275-04. All rights reserved.
//

import UIKit

class SetUpAlarmViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{

    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var musicTab: UIPickerView!
    
    
    let musicList = ["Summer","Whistle","Truth","Phantom","Dogs"]
    var musicTitle = "Summer"
    var alarmisset = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer.enabled = false
        datePicker.datePickerMode = UIDatePickerMode.Time
    }


    
    func returnselectedDate()-> NSDate{
        return datePicker.date
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return musicList.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return musicList[row]
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        musicTitle = musicList[row]
    }
    
    func selectedMusicTitle()-> String{
        return musicTitle
    }
    @IBAction func setalarm(sender: AnyObject) {
        self.alarmisset = true
        self.performSegueWithIdentifier("setAlarm", sender: self)
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
