//
//  WinAgressFoldCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/22/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class WinAgressFoldCell: UICollectionViewCell {
    
    @IBOutlet var statIcon: [UIImageView]!
    @IBOutlet weak var statLabel: UILabel!
    
    @IBOutlet weak var userRate: UILabel!
    @IBOutlet weak var opponentsRate: UILabel!
    @IBOutlet weak var sectionName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        sectionName.font = .sectionLabelFont
    }
    
    enum CellType {
        case agression
        case winRate
        case foldRate
        
    }
    
    func setupsForCell(_ cell: CellType) {
        if let model = InfoModel.singleCellModel[String(describing: UserGameStyleCell.self)] as? UserGameStyleCellModel {
            
            if cell == .winRate {
                if let winRate = model.winRate {
                    let rate = winRate*100
                    for image in self.statIcon {
                        image.image = UIImage(named: "icWinRate")
                    }
                    self.statLabel.text = "WIN RATE"
                    self.opponentsRate.text = "\(Int(rate))%"
                    self.backgroundColor = #colorLiteral(red: 0.9803064466, green: 0.9804469943, blue: 0.9802758098, alpha: 1)
                }
            }
            
            if cell == .foldRate {
                if let foldRate = model.foldRate {
                    let rate = foldRate*100
                    self.opponentsRate.text = "\(Int(rate))%"
                    for image in self.statIcon {
                        image.image = UIImage(named: "icAgression")
                    }
                    self.statLabel.text = "AGRESSION"
                    self.backgroundColor = .white
                }
            }
            
            if cell == .agression {
                if let agress = model.agression {
                    let rate = agress*100
                    self.opponentsRate.text = "\(Int(rate))%"
                    
                    for image in self.statIcon {
                        image.image = UIImage(named: "icFoldRate")
                    }
                    
                    self.statLabel.text = "FOLD RATIO"
                    self.backgroundColor = #colorLiteral(red: 0.9803064466, green: 0.9804469943, blue: 0.9802758098, alpha: 1)
                }
            }
            
        }
    }
    
}


