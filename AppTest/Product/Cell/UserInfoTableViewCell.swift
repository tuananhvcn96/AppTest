//
//  UserInfoTableViewCell.swift
//  AppTest
//
//  Created by T.A Savvycom on 10/18/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var image3: UIButton!
    @IBOutlet weak var image4: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.image1.layer.cornerRadius = image1.frame.height / 2
        self.image1.layer.masksToBounds = true
        
        self.image2.layer.cornerRadius = image2.frame.height / 2
        self.image2.layer.masksToBounds = true
        
        self.image3.layer.cornerRadius = image3.frame.height / 2
        self.image3.layer.masksToBounds = true
        
        self.image4.layer.cornerRadius = image4.frame.height / 2
        self.image4.layer.masksToBounds = true
    }
}
