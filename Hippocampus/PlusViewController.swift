//
//  PlusViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/4/26.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController {
    
   


    @IBOutlet weak var EnterDairy: UITextView!
    
    @IBOutlet weak var DateBtn: UITextField!
    
    //let date = DatePicker.date
    let DatePicker = UIDatePicker()
    
    let dateFormatter = DateFormatter()
    
    func createDate(){
        
        DatePicker.datePickerMode = .dateAndTime
        DatePicker.addTarget(self, action: #selector(updateDateForTextField(isDoneBtnClicked:)), for: .valueChanged)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.black
        toolBar.isTranslucent = true
        
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        let cancelbtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelClicked))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([cancelbtn, flexible, donebtn], animated: false)
        
        DateBtn.inputAccessoryView = toolBar
        DateBtn.inputView = DatePicker
    }
    
    func doneClicked() {
        updateDateForTextField(isDoneBtnClicked: true)
        self.view.endEditing(true)
        
    }
    
    func cancelClicked() {
        updateDateForTextField(isDoneBtnClicked: false)
        self.view.endEditing(true)
        
    }
    
    func updateDateForTextField(isDoneBtnClicked: Bool) {
       
        EnterDairy.text = dateFormatter.string(from: DatePicker.date)
        Dairy_Date = DatePicker.date

    }

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        createDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
