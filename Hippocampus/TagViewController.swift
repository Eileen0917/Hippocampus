//
//  HomeViewController.swift
//  Hippocampus
//
//  Created by Eileen on 2017/4/26.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit

class TagViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // number of rows in table view
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Diary_Tag.count
    }
    
    // create a cell for each table view row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //利用identifer找到cell
        
        
        let cellIdentifier = "TagTableViewCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! TagTableViewCell
        
        cell.preservesSuperviewLayoutMargins = false
        
        // Configure the cell...
        cell.tagTitle.text = Diary_Tag[0]
        
        return cell
    }
//
//    
//    //選了一篇文章
//    //delegate
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        
//        readarticlestr = article[article.count - indexPath.row - 1 ].subcontent
//        readarticletitle = article[article.count - indexPath.row - 1 ].title
//        print("title" + readarticletitle)
//        V_removeNaviLogo()
//        V_removeSecondLabel()
//        performSegueWithIdentifier("readarticle", sender: self)
//    }

    

}
