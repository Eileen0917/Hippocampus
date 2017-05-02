//
//  PlusViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/4/26.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit

class PlusViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,  UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    let toolBar = UIToolbar()
    
    
//////////////////////////////////////////////////////
    
    //Date

    @IBOutlet weak var EnterDairy: UITextView!
    @IBOutlet weak var DateBtn: UITextField!
    let DatePicker = UIDatePicker()
    let dateFormatter = DateFormatter()
    
    func createDate(){
        
        DatePicker.datePickerMode = .dateAndTime
        DatePicker.addTarget(self, action: #selector(updateDateForTextField(isDoneBtnClicked:)), for: .valueChanged)
        
        
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDateClicked))
        let cancelbtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelDateClicked))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([cancelbtn, flexible, donebtn], animated: false)
        
        DateBtn.inputAccessoryView = toolBar
        DateBtn.inputView = DatePicker
    }
    
    func doneDateClicked() {
        
        updateDateForTextField(isDoneBtnClicked: true)
        self.view.endEditing(true)
    }
    
    func cancelDateClicked() {
        
        updateDateForTextField(isDoneBtnClicked: false)
        self.view.endEditing(true)
    }
    
    func updateDateForTextField(isDoneBtnClicked: Bool) {
        
        EnterDairy.text = dateFormatter.string(from: DatePicker.date)
        DateBtn.text = dateFormatter.string(from: DatePicker.date)
        //Diary_Date = DatePicker.date
    }

//////////////////////////////////////////////////////
    
    //Picture
    
    @IBOutlet weak var myImage: UIImageView!
    let imagePicker = UIImagePickerController()
    
    @IBAction func PicByn(_ sender: AnyObject) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        imagePicker.modalPresentationStyle = .popover
        
        let popover = imagePicker.popoverPresentationController
        popover?.sourceView = myImage
        popover?.sourceRect = myImage.bounds
        popover?.permittedArrowDirections = .any
        
        show(imagePicker, sender: myImage)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        myImage.image = image
        dismiss(animated: true, completion: nil)
    }
    
//////////////////////////////////////////////////////
    
    // weather
    
    @IBOutlet weak var weatherbtn: UITextField!
    let weatherPicker = UIPickerView()
    let weather = ["Sunny" , "Cloudy" , "Windy" , "Rainy" , "Snow" , "Flog"]
    
    func createWeather(){
        
        weatherPicker.delegate = self as? UIPickerViewDelegate
        weatherPicker.dataSource = self as? UIPickerViewDataSource
        weatherbtn.tag = 100
        
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneWClicked))
        let cancelbtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelWClicked))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([cancelbtn, flexible, donebtn], animated: false)
        
        weatherbtn.inputAccessoryView = toolBar
        weatherbtn.inputView = weatherPicker
        
    }
    
    func doneWClicked() {
        
        updateWeatherForTextField(isDoneBtnClicked: true)
        self.view.endEditing(true)
    }
    
    func cancelWClicked() {
        
        updateWeatherForTextField(isDoneBtnClicked: false)
        self.view.endEditing(true)
    }
    
    func updateWeatherForTextField(isDoneBtnClicked: Bool) {
        
        //weatherbtn.text = dateFormatter.string(from: DatePicker.date)
        //Diary_Date = DatePicker.date
    }
    
    // UIPickerViewDataSource 必須實作的方法：UIPickerView 有幾列可以選擇
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewDataSource 必須實作的方法：UIPickerView 各列有多少行資料
    func pickerView(_ pickerView: UIPickerView,numberOfRowsInComponent component: Int) -> Int {
        return weather.count
    }
    
    // UIPickerView 每個選項顯示的資料
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return weather[row]
    }
    
    // UIPickerView 改變選擇後執行的動作
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weatherbtn.text = weather[row]
    }

    
 
//////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        createDate()
        
        createWeather()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}
