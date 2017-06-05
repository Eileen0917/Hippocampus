//
//  HomeViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/4/26.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit
import Firebase

class TagDoneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var table: UITableView!
    var sheet = [diary]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let query = FIRDatabase.database().reference().child("diary").queryOrdered(byChild:"tag").queryEqual(toValue: "done")
        query.observe(FIRDataEventType.value, with:{(snapshot) in
            if snapshot.childrenCount>0
            {
                self.sheet.removeAll()
                
                for d in snapshot.children.allObjects as![FIRDataSnapshot]
                {
                    let sheetOjbect = d.value as! [String: Any]
                    
                    let sheetcontent = sheetOjbect["content"] as! String
                    let sheetdate = sheetOjbect["date"] as! String
                    let sheetlocation = sheetOjbect["location"] as! String
                    let sheettag = sheetOjbect["tag"] as! String
                    let sheettitle = sheetOjbect["title"] as! String
                    let sheetweather = sheetOjbect["weather"] as! String
                    let sheetdata = diary(title:sheettitle, date: sheetdate, comment: sheetcontent, location: sheetlocation, weather: sheetweather, tag: sheettag)
                    self.sheet.append(sheetdata)
                }
                self.table.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sheet.count
    }

    
    // create a cell for each table view row
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //利用identifer找到cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "TagDoneCell", for: indexPath) as! TagDoneTableViewCell
        //cell.preservesSuperviewLayoutMargins = false
        
        // Configure the cell...
        let sheetdata: diary
        sheetdata = sheet[indexPath.row]
        cell.tagDate?.text = sheetdata.date
        cell.tagTitle?.text = sheetdata.title
//        cell.tagDate?.text = "2017-07-08 14:35"
//        cell.tagTitle?.text = "qqq"
        
        return cell
    }
}
