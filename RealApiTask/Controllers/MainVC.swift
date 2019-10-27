//
//  MainVC.swift
//  RealApiTask
//
//  Created by Arsen on 10/20/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

private let userInfoRI = "UserInfoCell"
private let userGameStyleRI = "UserGameStyleCell"
private let citiBadgesRI = "CityBadgesCell"
private let statisticsRI = "StatisticsCell"
private let comparisonRI = "ComparisonCell"

class MainVC: UICollectionViewController {
    let apiMethods = APIMethods()
    
    
    static var compCelFrameWidth: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
            self.collectionView.reloadData()
        })

        apiMethods.getUserData()
      
        let userInfoCellNib = UINib.init(nibName: String(describing: UserInfoCell.self), bundle: nil)
        let userGameStyleCellNib = UINib.init(nibName: String(describing: UserGameStyleCell.self), bundle: nil)
        let statisticsCellNib = UINib.init(nibName: String(describing: StatisticsCell.self), bundle: nil)
      
        self.collectionView.register(userInfoCellNib, forCellWithReuseIdentifier: userInfoRI)
        self.collectionView.register(userGameStyleCellNib, forCellWithReuseIdentifier: userGameStyleRI)
        self.collectionView.register(CityBadgesCell.self, forCellWithReuseIdentifier: citiBadgesRI)
        self.collectionView.register(statisticsCellNib, forCellWithReuseIdentifier: statisticsRI)
        self.collectionView.register(ComparisonCell.self, forCellWithReuseIdentifier: comparisonRI)


        
    }

    func setups() {
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
       
        if indexPath.row == 0 {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userInfoRI, for: indexPath) as! UserInfoCell
            cell.setup()
            return cell
        } else if indexPath.row == 1 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: userGameStyleRI, for: indexPath) as! UserGameStyleCell
            cell.setupViews()
        return cell
        } else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: citiBadgesRI, for: indexPath) as! CityBadgesCell
            cell.installData()
            return cell
        } else if indexPath.row == 3 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: statisticsRI, for: indexPath) as! StatisticsCell
            return cell
        } else if indexPath.row == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: comparisonRI, for: indexPath) as! ComparisonCell
            
            return cell
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
            return CGSize(width: view.frame.width, height: 50)
        } else if indexPath.row == 4 {
            MainVC.compCelFrameWidth = view.frame.width - 20
            return CGSize(width: view.frame.width - 20, height: 545)
        }

        return CGSize(width: 50, height: 400)
    }
    

    
}
