//
//  UserTableViewCell.swift
//  AppTest
//
//  Created by Tuan Anh on 10/19/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class UserTwoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewUserTwo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageViewUserTwo.layer.cornerRadius = imageViewUserTwo.frame.height / 2
        self.imageViewUserTwo.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
