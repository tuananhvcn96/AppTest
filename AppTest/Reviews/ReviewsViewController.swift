//
//  ReviewsViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/20/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class ReviewsViewController: UIViewController {

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    static let iddentifer = "ReviewsViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.image1.layer.cornerRadius = image1.frame.height / 2
        self.image1.layer.masksToBounds = true
        
        self.image2.layer.cornerRadius = image2.frame.height / 2
        self.image2.layer.masksToBounds = true
    }
}
