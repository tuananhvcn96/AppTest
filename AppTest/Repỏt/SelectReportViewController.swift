//
//  SelectReportViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/20/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class SelectReportViewController: UIViewController {
    
    static let iddentifer = "SelectReportViewController"

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var offiecListing: UILabel!
    @IBOutlet weak var spamLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        view.isOpaque = false
        self.setuptapHover()
        // Do any additional setup after loading the view.
    }
    func setuptapHover(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(SelectReportViewController.tapFunction))
        itemLabel.isUserInteractionEnabled = true
        itemLabel.addGestureRecognizer(tap)
    }
    
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: ProductReportViewController.iddentifer) {
            presentedViewController.providesPresentationContextTransitionStyle = true
            presentedViewController.definesPresentationContext = true
            presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
            presentedViewController.view.backgroundColor = UIColor.init(white: 0.2 , alpha: 0.8)
            self.present(presentedViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonClose(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
