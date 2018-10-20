//
//  UserTableViewCell.swift
//  AppTest
//
//  Created by T.A Savvycom on 10/18/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewUser: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageViewUser.layer.cornerRadius = imageViewUser.frame.height / 2
        
        
        self.imageViewUser.layer.masksToBounds = true
    }
}
