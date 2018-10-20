//
//  HomeTableViewCell.swift
//  AppTest
//
//  Created by Tuan Anh on 10/17/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewHome: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        self.setupCollectionView()
        collectionView.showsHorizontalScrollIndicator = false

    }
    
    func setupCollectionView(){
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        //flowLayout.minimumLineSpacing = 50
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 5)
        flowLayout.invalidateLayout()
        
        let hWidth = (UIScreen.main.bounds.width - 13) / 1.5
        flowLayout.scrollDirection = .horizontal
        //let hWidth = 233 * (UIScreen.main.bounds.size.width / 750)
        flowLayout.itemSize = CGSize(width: hWidth, height: 233)
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
    }
    
    
}

extension HomeTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        return cell
    }
}
