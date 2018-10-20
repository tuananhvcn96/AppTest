//
//  ReportViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/20/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {
    
    static let iddentifer = "ReportViewController"


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonTap(_ sender: Any) {
        guard let selectReportProductVC = self.storyboard?.instantiateViewController(withIdentifier: SelectReportViewController.iddentifer) as? SelectReportViewController else { return }
        self.present(selectReportProductVC, animated: true, completion: nil)
    }
    
}
