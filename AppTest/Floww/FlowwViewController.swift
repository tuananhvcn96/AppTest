//
//  FlowwViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/20/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class FlowwViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    static let iddentifer = "FlowwViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.setupCell()
    }
    
    func setupCell() {
        let nib = UINib(nibName: "MapTwoTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "MapTwoTableViewCell")
        
        let nibUser = UINib(nibName: "ReviewsTableViewCell", bundle: nil)
        self.tableView.register(nibUser, forCellReuseIdentifier: "ReviewsTableViewCell")
        
        let nibUserInfo = UINib(nibName: "UserInfoTableViewCell", bundle: nil)
        self.tableView.register(nibUserInfo, forCellReuseIdentifier: "UserInfoTableViewCell")
    }
}

extension FlowwViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 || section == 2 {
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 262
        }
        if indexPath.section == 1 {
            return 304
        }
        
        if indexPath.section == 2 {
            return 283
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell: MapTwoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MapTwoTableViewCell", for: indexPath) as? MapTwoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 1 {
            guard let cell: ReviewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as? ReviewsTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
            
        else if indexPath.section == 2 {
            guard let cell: UserInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as? UserInfoTableViewCell else {
                return UITableViewCell()
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            guard let detailProductVC = self.storyboard?.instantiateViewController(withIdentifier: ReviewsViewController.iddentifer) as? ReviewsViewController else { return }
            self.navigationController?.show(detailProductVC, sender: true)
        }
    }
}
