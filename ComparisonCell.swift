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



class ComparisonCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let gameStatsCollectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 450, height: 600)), collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews() {
        let nib = UINib.init(nibName: String(describing: BestHandCell.self), bundle: nil)
        let nib2 = UINib.init(nibName: String(describing: RangCell.self), bundle: nil)
        let nib3 = UINib.init(nibName: String(describing: TitleCell.self), bundle: nil)
        let nib4 = UINib.init(nibName: String(describing: WinAgressFoldCell.self), bundle: nil)
        let nib5 = UINib.init(nibName: String(describing: LastGamesCell.self), bundle: nil)
        let nib6 = UINib.init(nibName: String(describing: DateCell.self), bundle: nil)

        self.gameStatsCollectioView.register(nib, forCellWithReuseIdentifier: bestHandId)
        self.gameStatsCollectioView.register(nib2, forCellWithReuseIdentifier: rangCellId)
        self.gameStatsCollectioView.register(nib3, forCellWithReuseIdentifier: titleCellId)
        self.gameStatsCollectioView.register(nib4, forCellWithReuseIdentifier: winAgressFoldCellId)
        self.gameStatsCollectioView.register(nib5, forCellWithReuseIdentifier: lastGamesCellId)
        self.gameStatsCollectioView.register(nib6, forCellWithReuseIdentifier: dateCellId)


        
        self.addSubview(gameStatsCollectioView)
        
        gameStatsCollectioView.delegate = self
        gameStatsCollectioView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        let cell2 =  collectionView.dequeueReusableCell(withReuseIdentifier: winAgressFoldCellId, for: indexPath) as! WinAgressFoldCell
        
        if indexPath.row == 0 {
         cell =  collectionView.dequeueReusableCell(withReuseIdentifier: bestHandId, for: indexPath) as! BestHandCell
        } else if indexPath.row == 1 {
            cell =  collectionView.dequeueReusableCell(withReuseIdentifier: rangCellId, for: indexPath) as! RangCell
        } else if indexPath.row == 2 {
            cell =  collectionView.dequeueReusableCell(withReuseIdentifier: titleCellId, for: indexPath) as! TitleCell
        } else if indexPath.row == 3 {
            for image in cell2.statIcon {
                image.image = UIImage(named: "icWinRate")
            }
            cell2.statLabel.text = "WIN RATE"
            cell2.backgroundColor = #colorLiteral(red: 0.9803064466, green: 0.9804469943, blue: 0.9802758098, alpha: 1)
            return cell2
            
        } else if indexPath.row == 4 {
            for image in cell2.statIcon {
                image.image = UIImage(named: "icAgression")
            }
            cell2.statLabel.text = "AGRESSION"
          
            cell2.backgroundColor = .white
        
            return cell2
        } else if indexPath.row == 5 {
            
            for image in cell2.statIcon {
                image.image = UIImage(named: "icFoldRate")
            }
            cell2.statLabel.text = "FOLD RATIO"
            cell2.backgroundColor = #colorLiteral(red: 0.9803064466, green: 0.9804469943, blue: 0.9802758098, alpha: 1)

            return cell2
        } else if indexPath.row == 6 {
            cell =  collectionView.dequeueReusableCell(withReuseIdentifier: lastGamesCellId, for: indexPath) as! LastGamesCell
        } else if indexPath.row == 7 {
            cell =  collectionView.dequeueReusableCell(withReuseIdentifier: dateCellId, for: indexPath) as! DateCell
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 400, height: 150)
        } else if indexPath.row == 1, indexPath.row == 6 {
            return CGSize(width: 400, height: 60)
        } else if indexPath.row == 2, indexPath.row == 3, indexPath.row == 4, indexPath.row == 5, indexPath.row == 7 {
            return CGSize(width: 400, height: 40)
        }
        return CGSize(width: 400, height: 40)
    }

    

}
