//
//  DiaryViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/5/10.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit

class DiaryViewController: UIViewController {
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var weather: UITextField!
    @IBOutlet weak var tag: UITextField!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var dtitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comment.text = d_comment
        location.text = d_location
        weather.text = d_weather
        tag.text = d_tag
        text.text = d_date
        dtitle.text = d_title
        
        

        // Do any additional setup after loading the view.
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
