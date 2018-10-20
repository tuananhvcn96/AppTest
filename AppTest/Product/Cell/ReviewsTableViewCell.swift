//
//  ReviewsTableViewCell.swift
//  AppTest
//
//  Created by T.A Savvycom on 10/18/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class ReviewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewReviews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageViewReviews.layer.cornerRadius = imageViewReviews.frame.height / 2
        self.imageViewReviews.layer.masksToBounds = true
    }
    
}
