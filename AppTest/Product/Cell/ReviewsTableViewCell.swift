//
//  ReviewsTableViewCell.swift
//  AppTest
//
//  Created by T.A Savvycom on 10/18/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

//protocol HoverImage: class {
//    func hoverSetImage(_ cell: ReviewsTableViewCell, )
//}

class ReviewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewReviews: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageViewReviews.layer.cornerRadius = imageViewReviews.frame.height / 2
        self.imageViewReviews.layer.masksToBounds = true
        //self.setupHoverImagee()
    }
    
    func setupHoverImagee() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ReviewsTableViewCell.imageTapped(gesture:)))
        
        // add it to the image view;
        imageViewReviews.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        imageViewReviews.isUserInteractionEnabled = true
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("oks")
        }
    }
    
}
