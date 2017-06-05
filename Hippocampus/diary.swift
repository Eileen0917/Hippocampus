//
//  GlobalVar.swift
//  Hippocampus
//
//  Created by Eileen on 2017/4/26.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import Foundation


// diary var

//class diary {
    
//    var Diary_Date = String()
//    var Diary_Comment = String()
//    var Diary_Location = [String()]
//    var Diary_Weather = String()
//    var Diary_Tag = [String()]
//    //var Dairy_Image = Image()
    
//}


class diary
{
    var title: String?
    var date: String?
    var comment: String?
    var location: String?
    var weather: String?
    var tag: String?
    //var image: String? = "shit"
    
    
    init(title: String?, date: String?, comment: String?, location: String?, weather: String?, tag: String?)
    {
        self.title = title;
        self.date = date;
        self.comment = comment;
        self.location = location;
        self.weather = weather;
        self.tag = tag;
    }
}


