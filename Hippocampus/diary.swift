//
//  GlobalVar.swift
//  Hippocampus
//
//  Created by Eileen on 2017/4/26.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import Foundation

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

var d_comment: String?
var d_location: String?
var d_weather: String?
var d_tag: String?
var d_date: String?
var d_title: String?


