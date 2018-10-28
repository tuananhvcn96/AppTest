//
//  ProductReportViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/28/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class ProductReportViewController: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    static let iddentifer = "ProductReportViewController"

    override func viewDidLoad() {
        super.viewDidLoad()
        textFiled.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    @IBAction func buttonClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
