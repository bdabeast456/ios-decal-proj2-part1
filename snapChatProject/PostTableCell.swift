//
//  PostTableCell.swift
//  snapChatProject
//
//  Created by Brandon Pearl on 3/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostTableCell: UITableViewCell {
    @IBOutlet weak var readImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeSincePosted: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
