//
//  TagTodoTableViewCell.swift
//  Hippocampus
//
//  Created by Eileen on 2017/6/5.
//  Copyright © 2017年 Eileen. All rights reserved.
//

import UIKit

class TagTodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tagTodoTitle: UILabel!
    @IBOutlet weak var tagTodoDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
