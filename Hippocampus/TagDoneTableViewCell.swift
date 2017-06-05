//
//  TagTableViewCell.swift
//  Hippocampus
//
//  Created by Eileen on 2017/5/10.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit

class TagDoneTableViewCell: UITableViewCell {


    @IBOutlet weak var tagTitle: UILabel!
    @IBOutlet weak var tagDate: UILabel!
    
       
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
