//
//  PlusViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/4/26.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController {

    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBAction func BtnDate(_ sender: AnyObject) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        
        EnterDairy.inputView = datePickerView
        
        datePickerView.addTarget(self, action: #selector(PlusViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
        
//        let date = DatePicker.date
//        Dairy_Date = date
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
//        EnterDairy.text = dateFormatter.string(from: date)
        
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        EnterDairy.text = dateFormatter.string(from: sender.date)
        Dairy_Date = sender.date
        
        
    }
    
    
    
    @IBOutlet weak var EnterDairy: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
