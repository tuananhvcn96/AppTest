//
//  Popup.swift
//  DucTran-MapKit
//
//  Created by Tuan Anh on 7/20/18.
//  Copyright © 2018 Duc Tran. All rights reserved.
//

import Foundation
import UIKit

class Popup: UIViewController {

    var venus: Venue?
    var annotionView: AniitationView?
    
    @IBOutlet weak var aaaa: UILabel!
    @IBOutlet weak var bbbb: UILabel!
    
    var titleString = ""
    var subtitleString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aaaa.text = titleString
        bbbb.text = subtitleString
//        aaaa.text = "\(annotionView?.annotation?.title)"
//        bbbb.text = "dasdaas"
    }
    
}
