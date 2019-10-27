//
//  ComparisonCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/22/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

private let bestHandId = "BestHandCell"
private let rangCellId = "RangCell"
private let titleCellId = "TitleCell"
private let winAgressFoldCellId = "WinAgressFoldCell"
private let lastGamesCellId = "LastGamesCell"
private let dateCellId = "DateCell"
private let reportAbuseCellId = "ReportAbuseCell"



class ComparisonCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var model: [String: DataModel]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0, execute: {
            self.gameStatsCollectioView.reloadData()
        })
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let gameStatsCollectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: MainVC.compCelFrameWidth , height: 545)), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.yellow
        collectionView.layer.cornerRadius = 8
        collectionView.layer.shadowColor = UIColor.black.cgColor
        collectionView.layer.shadowRadius = 15
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews() {
        let bestHandCellNib = UINib.init(nibName: String(describing: BestHandCell.self), bundle: nil)
        let rangCellNib = UINib.init(nibName: String(describing: RangCell.self), bundle: nil)
        let titleCellNib = UINib.init(nibName: String(describing: TitleCell.self), bundle: nil)
        let WAFNib = UINib.init(nibName: String(describing: WinAgressFoldCell.self), bundle: nil)
        let lastGamesNib = UINib.init(nibName: String(describing: LastGamesCell.self), bundle: nil)
        let dataCellNib = UINib.init(nibName: String(describing: DateCell.self), bundle: nil)
        let reportAbuseNib = UINib.init(nibName: String(describing: ReportAbuseCell.self), bundle: nil)

        self.gameStatsCollectioView.register(bestHandCellNib, forCellWithReuseIdentifier: bestHandId)
        self.gameStatsCollectioView.register(rangCellNib, forCellWithReuseIdentifier: rangCellId)
        self.gameStatsCollectioView.register(titleCellNib, forCellWithReuseIdentifier: titleCellId)
        self.gameStatsCollectioView.register(WAFNib, forCellWithReuseIdentifier: winAgressFoldCellId)
        self.gameStatsCollectioView.register(lastGamesNib, forCellWithReuseIdentifier: lastGamesCellId)
        self.gameStatsCollectioView.register(dataCellNib, forCellWithReuseIdentifier: dateCellId)
        self.gameStatsCollectioView.register(reportAbuseNib, forCellWithReuseIdentifier: reportAbuseCellId)

        
        self.addSubview(gameStatsCollectioView)
        
        gameStatsCollectioView.delegate = self
        gameStatsCollectioView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = UICollectionViewCell()
        
        if indexPath.row == 0 {
         let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: bestHandId, for: indexPath) as! BestHandCell
            cell.setups()
            cell.backgroundColor = .whiteTwo
            
            return cell
        
        } else if indexPath.row == 1 {
           let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: rangCellId, for: indexPath) as! RangCell
            cell.backgroundColor = .white
            return cell

        } else if indexPath.row == 2 {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: titleCellId, for: indexPath) as! TitleCell
            cell.setups()
            cell.backgroundColor = .whiteTwo

            return cell
            
        } else if indexPath.row == 3 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: winAgressFoldCellId, for: indexPath) as! WinAgressFoldCell
            cell.setupsForCell(.winRate)
            cell.backgroundColor = .white

            return cell
            
        } else if indexPath.row == 4 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: winAgressFoldCellId, for: indexPath) as! WinAgressFoldCell
           cell.setupsForCell(.foldRate)
            cell.backgroundColor = .whiteTwo

          
            return cell
        } else if indexPath.row == 5 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: winAgressFoldCellId, for: indexPath) as! WinAgressFoldCell
            cell.setupsForCell(.agression)
            cell.backgroundColor = .white


            return cell
        } else if indexPath.row == 6 {
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: lastGamesCellId, for: indexPath) as! LastGamesCell
            cell.setups()
            cell.backgroundColor = .whiteTwo

            return cell
        } else if indexPath.row == 7 {
           let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: dateCellId, for: indexPath) as! DateCell
            cell.setups()
            cell.backgroundColor = .white

            return cell
        } else if indexPath.row == 8 {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reportAbuseCellId, for: indexPath) as! ReportAbuseCell
            cell.backgroundColor = .whiteTwo
            return cell
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = MainVC.compCelFrameWidth
        if indexPath.row == 0 {
            return CGSize(width: width, height: 150)
        } else if indexPath.row == 1 {
            return CGSize(width: width, height: 50)
        } else if indexPath.row == 2 {
            return CGSize(width: width, height: 30)
        } else if indexPath.row == 3 {
            return CGSize(width: width, height: 40)
        } else if indexPath.row == 4 {
            return CGSize(width: width, height: 45)
        } else if indexPath.row == 8 {
            return CGSize(width: width, height: 80)
        }
        
        return CGSize(width: width, height: 50)
    }

    

}
