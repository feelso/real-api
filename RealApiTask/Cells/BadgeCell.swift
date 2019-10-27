//
//  BadgeCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/21/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class BadgeCell: UICollectionViewCell {

    @IBOutlet weak var leftStar: UIImageView!
    @IBOutlet weak var centerStar: UIImageView!
    @IBOutlet weak var rightStar: UIImageView!
    @IBOutlet weak var badgeView: UIImageView!
    @IBOutlet weak var ribbonView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        
    }

    
    func installStarsWithAmount(_ number: Int) {
        guard (0...3).contains(number) else { return }
        
        if number == 0 {
            DispatchQueue.main.async {
                self.leftStar.image = UIImage(named: "icStarEmptyLeft")
                self.centerStar.image = UIImage(named: "icStarEmptyCenter")
                self.rightStar.image = UIImage(named: "icStarEmptyRight")
            }
        } else if number == 1 {
            DispatchQueue.main.async {
                self.leftStar.image = UIImage(named: "icStarLeft")
                self.centerStar.image = UIImage(named: "icStarEmptyCenter")
                self.rightStar.image = UIImage(named: "icStarEmptyRight")
            }
        } else if number == 2 {
            DispatchQueue.main.async {
                self.leftStar.image = UIImage(named: "icStarLeft")
                self.centerStar.image = UIImage(named: "icStarCenter")
                self.rightStar.image = UIImage(named: "icStarEmptyRight")
            }
        } else {
            DispatchQueue.main.async {
                self.leftStar.image = UIImage(named: "icStarLeft")
                self.centerStar.image = UIImage(named: "icStarCenter")
                self.rightStar.image = UIImage(named: "icStarRight")
            }
        }
    }
    
    func setupsFor(indexPath: IndexPath) {
         if let model = InfoModel.multipleCellsModel[String(describing: BadgeCellModel.self)] as? [BadgeCellModel] {
            
            if let badge = model[indexPath.row].badge {
                DispatchQueue.main.async {
                    self.badgeView.image = badge
                }
            }
            if let ribbon = model[indexPath.row].badgeRibbon {
                DispatchQueue.main.async {
                    self.ribbonView.image = ribbon
                }
            }
            if let numberOfStars = model[indexPath.row].numberOfStars {
                DispatchQueue.main.async {
                    self.installStarsWithAmount(numberOfStars)
                }
            }
        }
    }

    
}

class BadgeCellModel: DataModel {
    var badge: UIImage?
    var badgeRibbon: UIImage?
    var numberOfStars: Int?
    
}
