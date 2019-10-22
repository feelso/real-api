//
//  MainVC.swift
//  RealApiTask
//
//  Created by Arsen on 10/20/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let reuseIdentifier2 = "UserGameStyleCell"
private let reuseIdentifier3 = "CityBadgesCell"
private let reuseIdentifier4 = "StatisticsCell"
private let comparisonCell = "ComparisonCell"

class MainVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userInfoCellNib = UINib.init(nibName: String(describing: UserInfoCell.self), bundle: nil)
        let userGameStyleCellNib = UINib.init(nibName: String(describing: UserGameStyleCell.self), bundle: nil)
        let statisticsCellNib = UINib.init(nibName: String(describing: StatisticsCell.self), bundle: nil)
      
        self.collectionView.register(userInfoCellNib, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView.register(userGameStyleCellNib, forCellWithReuseIdentifier: reuseIdentifier2)
        self.collectionView.register(CityBadgesCell.self, forCellWithReuseIdentifier: reuseIdentifier3)
        self.collectionView.register(statisticsCellNib, forCellWithReuseIdentifier: reuseIdentifier4)
        self.collectionView.register(ComparisonCell.self, forCellWithReuseIdentifier: comparisonCell)


      //  self.collectionView!.register(UserInfoCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
    }

   

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if indexPath.row == 0 {
         cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! UserInfoCell
        } else if indexPath.row == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier2, for: indexPath) as! UserGameStyleCell
        } else if indexPath.row == 2 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier3, for: indexPath) as! CityBadgesCell
        } else if indexPath.row == 3 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier4, for: indexPath) as! StatisticsCell
        } else if indexPath.row == 4 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: comparisonCell, for: indexPath) as! ComparisonCell
            cell.layer.cornerRadius = 8
            cell.backgroundColor = .gray
        }

    
        return cell
    }
    
    
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: view.frame.width, height: 355)
        } else if indexPath.row == 1 {
            return CGSize(width: view.frame.width, height: 100)
        } else if indexPath.row == 2 {
            return CGSize(width: view.frame.width, height: 150)
        } else if indexPath.row == 3 {
            return CGSize(width: view.frame.width, height: 70)
        } else if indexPath.row == 4 {
            return CGSize(width: view.frame.width, height: 520)
        }

        return CGSize(width: 50, height: 400)
    }
}
