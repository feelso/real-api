//
//  BadgeCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/21/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class BadgeCell: UICollectionViewCell {

    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var badgeView: UIImageView!
    @IBOutlet weak var ribbonView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        badgeView.backgroundColor = .blue
//        ribbonView.backgroundColor = .red
//        star2.backgroundColor = .yellow
    }

}
