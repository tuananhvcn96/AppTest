//
//  UserInfoViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/19/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    static let iddentifer = "UserInfoViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupCell()
    }
    
    func setupCell() {
        let nib = UINib(nibName: "UserTwoTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "UserTwoTableViewCell")
        
        let nibReviews = UINib(nibName: "ListingTableViewCell", bundle: nil)
        self.tableView.register(nibReviews, forCellReuseIdentifier: "ListingTableViewCell")
        
        let nibUser = UINib(nibName: "ReviewsTableViewCell", bundle: nil)
        self.tableView.register(nibUser, forCellReuseIdentifier: "ReviewsTableViewCell")
        
        let nibUserInfo = UINib(nibName: "UserInfoTableViewCell", bundle: nil)
        self.tableView.register(nibUserInfo, forCellReuseIdentifier: "UserInfoTableViewCell")
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            guard let userVC = self.storyboard?.instantiateViewController(withIdentifier: UserViewController.iddentifer) as? UserViewController else { return }
            self.navigationController?.pushViewController(userVC, animated: true)
        }
    }
    
}

extension UserInfoViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 || section == 2 || section == 3{
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
            return 259
        }
        
        if indexPath.section == 2 {
            return 304
        }
        
        if indexPath.section == 3 {
            return 283
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell: UserTwoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserTwoTableViewCell", for: indexPath) as? UserTwoTableViewCell else {
                return UITableViewCell()
            }
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UserTwoTableViewCell.imageTapped(gesture:)))
            
            // add it to the image view;
            cell.imageViewUserTwo.addGestureRecognizer(tapGesture)
            // make sure imageView can be interacted with by user
            cell.imageViewUserTwo.isUserInteractionEnabled = true
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        } else if indexPath.section == 1 {
            guard let cell: ListingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListingTableViewCell", for: indexPath) as? ListingTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
            
        else if indexPath.section == 2 {
            guard let cell: ReviewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as? ReviewsTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
            
        else if indexPath.section == 3 {
            guard let cell: UserInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCell", for: indexPath) as? UserInfoTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            guard let detailProductVC = self.storyboard?.instantiateViewController(withIdentifier: FlowwViewController.iddentifer) as? FlowwViewController else { return }
            self.navigationController?.show(detailProductVC, sender: true)
        }
    }
}
