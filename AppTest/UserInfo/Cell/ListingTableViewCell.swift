//
//  ListingTableViewCell.swift
//  AppTest
//
//  Created by Tuan Anh on 10/19/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewListing: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewListing.dataSource = self
        self.setupCollectionView()
        collectionViewListing.showsHorizontalScrollIndicator = false

    }
    
    func setupCollectionView(){
        let nib = UINib(nibName: "ListingCollectionViewCell", bundle: nil)
        self.collectionViewListing.register(nib, forCellWithReuseIdentifier: "ListingCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
//        //flowLayout.minimumLineSpacing = 50
        flowLayout.sectionInset = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
        flowLayout.invalidateLayout()
        
        let hWidth = (UIScreen.main.bounds.width - 30) / 2.3
        flowLayout.scrollDirection = .horizontal
        //let hWidth = 233 * (UIScreen.main.bounds.size.width / 750)
        flowLayout.itemSize = CGSize(width: hWidth, height: 150)
        collectionViewListing.setCollectionViewLayout(flowLayout, animated: true)
    }
}

extension ListingTableViewCell: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListingCollectionViewCell", for: indexPath) as! ListingCollectionViewCell
            return cell
        }
    }

