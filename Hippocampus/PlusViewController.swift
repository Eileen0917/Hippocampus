//
//  PlusViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/4/26.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

var ref: FIRDatabaseReference!

class PlusViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate,  UIPickerViewDelegate, UIPickerViewDataSource  {
    
    
    let toolBar = UIToolbar()
    private var isKeyboardShown = false
    
    

    
    
//////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        EnterDairy.delegate = self
        
        ref = FIRDatabase.database().reference().child("diary")
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        createDate()
        
        createWeather()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // 設定delegate 為self後，可以自行增加delegate protocol
    
    // 開始進入編輯狀態
    func textFieldDidBeginEditing(_ textField: UITextField){
        
    }
    
    // 可能進入結束編輯狀態
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 結束編輯狀態(意指完成輸入或離開焦點)
    func textFieldDidEndEditing(_ textField: UITextField) {
        locationBtn = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }

    
    
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
        
        //EnterDairy.text = dateFormatter.string(from: DatePicker.date)
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
        
        weatherPicker.delegate = self
        weatherPicker.dataSource = self
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
        
        weatherbtn.text = weatherbtn.text
        print("WeatherBtn is good!!" + weatherbtn.text!)
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
        print("WeatherBtn is good!!" + weatherbtn.text!)
    }
    
    

    
 
//////////////////////////////////////////////////////
    
    //tag
    
    @IBOutlet weak var tagBtn: UITextField!
    
    var tag = [String]()
    
//////////////////////////////////////////////////////
    
    
    //location
    
    @IBOutlet weak var locationBtn: UITextField!
    var location = [String]()
    
//////////////////////////////////////////////////////
    
    //title
    
    
    
    @IBOutlet weak var titleBtn: UITextField!
    
    
//////////////////////////////////////////////////////
    
    //submit
    

    
    @IBAction func btnCancel(_ sender: AnyObject) {
        
        clear()
    }
    

    @IBAction func btnSave(_ sender: UIButton) {
        
        if (DateBtn.text == ""){
            let date = Date()
            let result = dateFormatter.string(from: date)
            DateBtn.text = result
        }
        
        if (titleBtn.text == "" || locationBtn.text == ""){
            simpleHint(t: "Error", m: "You must entry title and location.")
        }
        else{
            data()
            simpleHint(t: "Confirm", m:"Your diary is saved.")
            clear()
        }
        
        
        
    }
    
    func data(){
        let key = ref.childByAutoId().key
        let diary: [String: Any] = [
            "title":titleBtn.text!,
            "content":EnterDairy.text,
            "date":DateBtn.text!,
            //"image":myImage.image!,
            "location":locationBtn.text!,
            "weather":weatherbtn.text!,
            "tag":tagBtn.text!
        ]
        ref.child(key).setValue(diary)
        
    }
    
    func simpleHint(t: String, m: String) {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: t,
            message: m,
            preferredStyle: .alert)
        
        // 建立[確認]按鈕
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: {
                (action: UIAlertAction!) -> Void in
                print("按下確認後，閉包裡的動作")
        })
        alertController.addAction(okAction)
        
        // 顯示提示框
        self.present(
            alertController,
            animated: true,
            completion: nil)
    }
    
    func clear(){
        myImage.image = nil
        EnterDairy.text = ""
        DateBtn.text = ""
        weatherbtn.text = ""
        locationBtn.text = ""
        titleBtn.text = ""
        tagBtn.text = ""
    }
   

}
