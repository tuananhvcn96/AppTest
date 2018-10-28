//
//  FullScreenVC.swift
//  AppTest
//
//  Created by Tuan Anh on 10/27/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import Foundation
import UIKit

class FullScreenVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    static let iddentifer = "FullScreenVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}
