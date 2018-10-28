//
//  TakeHomeTableViewCell.swift
//  AppTest
//
//  Created by T.A Savvycom on 10/18/18.
//  Copyright © 2018 Tuan Anh. All rights reserved.
//

import UIKit

class TakeHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewTakeHome: UICollectionView!
    var myVar: Int = 4

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionViewTakeHome.dataSource = self
        self.setupCollectionView()
        collectionViewTakeHome.showsHorizontalScrollIndicator = false
    }
    
    func setupCollectionView(){
        let nib = UINib(nibName: "TakeHomeCollectionViewCell", bundle: nil)
        self.collectionViewTakeHome.register(nib, forCellWithReuseIdentifier: "TakeHomeCollectionViewCell")
        
        let flowLayout = UICollectionViewFlowLayout()
        //flowLayout.minimumLineSpacing = 50
        flowLayout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 5)
        flowLayout.invalidateLayout()
        
        let hWidth = (UIScreen.main.bounds.width - 13) / 1.5
        flowLayout.scrollDirection = .horizontal
        //let hWidth = 233 * (UIScreen.main.bounds.size.width / 750)
        flowLayout.itemSize = CGSize(width: hWidth, height: 233)
        collectionViewTakeHome.setCollectionViewLayout(flowLayout, animated: true)
    }
}

extension TakeHomeTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myVar
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TakeHomeCollectionViewCell", for: indexPath) as! TakeHomeCollectionViewCell
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        //let cell = collectionView.cellForItem(at: indexPath)
//        
//        guard let fullScreenVC = self.storyboard?.instantiateViewController(withIdentifier: FullScreenVC.iddentifer) as? FullScreenVC else { return }
//        
//    }
}
