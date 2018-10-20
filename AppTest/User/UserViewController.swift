//
//  UserViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/19/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var imageViewIM: UIImageView!
    @IBOutlet weak var image1: UIButton!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var image3: UIButton!
    @IBOutlet weak var image4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.imageViewIM.layer.cornerRadius = imageViewIM.frame.height / 2
        self.imageViewIM.layer.masksToBounds = true
        
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
