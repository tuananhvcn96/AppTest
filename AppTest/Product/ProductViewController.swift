//
//  ProductViewController.swift
//  AppTest
//
//  Created by T.A Savvycom on 10/18/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit
import Presentr

enum CustomElementType: String {
    case reviews
    case user
    case userinfo
    case map
}

protocol CustomElentModel: class {
    var type: CustomElementType { get }
}

class ProductViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    fileprivate var items = [CustomElentModel]()
    static let iddentifer = "ProductViewController"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        tableView.showsHorizontalScrollIndicator = false
        self.setupCell()
    }
    @IBAction func tapCallAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Subscribe", message: "Coming Soon", preferredStyle: .alert)
        let subButton = UIAlertAction(title: "Subcribe", style: .default, handler: self.sub)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(subButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func sub(alert: UIAlertAction) {
        print("Coming soon")
    }
    
    @objc func imageTapped(gesture: UIGestureRecognizer) {
        
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            guard let userVC = self.storyboard?.instantiateViewController(withIdentifier: UserViewController.iddentifer) as? UserViewController else { return }
            self.navigationController?.pushViewController(userVC, animated: true)
        }
    }
    
    func setupCell() {
        let nib = UINib(nibName: "TakeHomeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "TakeHomeTableViewCell")
        
        let nibReviews = UINib(nibName: "ReviewsTableViewCell", bundle: nil)
        self.tableView.register(nibReviews, forCellReuseIdentifier: "ReviewsTableViewCell")
        
        let nibUser = UINib(nibName: "UserTableViewCell", bundle: nil)
        self.tableView.register(nibUser, forCellReuseIdentifier: "UserTableViewCell")
        
        let nibUserInfo = UINib(nibName: "UserInfoTableViewCell", bundle: nil)
        self.tableView.register(nibUserInfo, forCellReuseIdentifier: "UserInfoTableViewCell")
        
        let nibMap = UINib(nibName: "MapTableViewCell", bundle: nil)
        self.tableView.register(nibMap, forCellReuseIdentifier: "MapTableViewCell")
    }
}


extension ProductViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 1 || section == 2 || section == 3 || section == 4{
            return 1
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 433
        }
        if indexPath.section == 1 {
            return 304
        }
        
        if indexPath.section == 2 {
            return 131
        }
        
        if indexPath.section == 3 {
            return 283
        }
        
        if indexPath.section == 4 {
            return 257
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell: TakeHomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TakeHomeTableViewCell", for: indexPath) as? TakeHomeTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        } else if indexPath.section == 1 {
            guard let cell: ReviewsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ReviewsTableViewCell", for: indexPath) as? ReviewsTableViewCell else {
                return UITableViewCell()
            }
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ReviewsTableViewCell.imageTapped(gesture:)))

            // add it to the image view;
            cell.imageViewReviews.addGestureRecognizer(tapGesture)
            // make sure imageView can be interacted with by user
            cell.imageViewReviews.isUserInteractionEnabled = true

            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
        
        else if indexPath.section == 2 {
            guard let cell: UserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else {
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
        
        else if indexPath.section == 4 {
            guard let cell: MapTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MapTableViewCell", for: indexPath) as? MapTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        }
       `
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if let presentedViewController = self.storyboard?.instantiateViewController(withIdentifier: ReportViewController.iddentifer) {
                presentedViewController.providesPresentationContextTransitionStyle = true
                presentedViewController.definesPresentationContext = true
                presentedViewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
                presentedViewController.view.backgroundColor = UIColor.init(white: 0.2 , alpha: 0.8)
                self.present(presentedViewController, animated: true, completion: nil)
            }

//            let presenter: Presentr = {
//                let widthSreen = Float(UIScreen.main.bounds.size.width)
//                let heigtScrren = Float(UIScreen.main.bounds.size.height)
//                let customType = PresentationType.custom(width: ModalSize.custom(size: widthSreen),
//                                                         height: ModalSize.custom(size: heigtScrren),
//                                                         center: ModalCenterPosition.center)
//
//                let customPresenter = Presentr(presentationType: customType)
//                customPresenter.roundCorners = true
//                customPresenter.keyboardTranslationType = .none
//                customPresenter.backgroundColor = .brown
//                customPresenter.dismissOnSwipe = true
//                return customPresenter
//            }()
//
//            let controller = ReportViewController()
//            customPresentViewController(presenter, viewController: controller, animated: true, completion: nil)
        }
        
        if indexPath.section == 2 {
            guard let detailProductVC = self.storyboard?.instantiateViewController(withIdentifier: UserInfoViewController.iddentifer) as? UserInfoViewController else { return }
            self.navigationController?.pushViewController(detailProductVC, animated: true)
        }
    }
}
