//
//  HomeViewController.swift
//  AppTest
//
//  Created by Tuan Anh on 10/17/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "logo"
        self.setupCell()
    }
    
    func setupCell() {
        let nib = UINib(nibName: "HomeTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "HomeTableViewCell")
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 457
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HomeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailProductVC = self.storyboard?.instantiateViewController(withIdentifier: ProductViewController.iddentifer) as? ProductViewController else { return }
            self.navigationController?.pushViewController(detailProductVC, animated: true)
    }
}

