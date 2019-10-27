//
//  BestHandCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/22/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class BestHandCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    @IBOutlet weak var sectionName: UILabel!
    @IBOutlet weak var opponentsImage: UIImageView!
    @IBOutlet var opponentsCards: [Card]!

    func setups() {
        sectionName.font = .sectionLabelFont
        if let model = InfoModel.singleCellModel[String(describing: BestHandCellModel.self)] as? BestHandCellModel {
            if let bestHands = model.bestHands {
                var i = 0
                var transformAngle: Double = -10
                
                for card in opponentsCards {
                    let degree = deg2rad(transformAngle)
                    card.transform = CGAffineTransform(rotationAngle: CGFloat(degree))
                    card.fillRankAndSuit(suit: bestHands[i].suit, rank: bestHands[i].rank)
                    
                    i += 1
                    transformAngle += 5
                    }
                }
                
            }
        if let model =  InfoModel.singleCellModel[String(describing: UserInfoCell.self)] as? UserInfoCellModel {
            if let photo = model.avatarImage {
                opponentsImage.layer.cornerRadius = opponentsImage.frame.width/2
                opponentsImage.image = photo
                
            }
        }


        }
    
    func deg2rad(_ number: Double) -> Double {
        return number * .pi / 180
    }

}


class BestHandCellModel: DataModel {
   
    var bestHands: [BestHand]?
    var photo: UIImage?
    
}





extension UIView {
   
    func fillCard(rank: String, suit: String, color: UIColor) {

        let labelRank = UILabel()
        labelRank.frame = CGRect(x: 7, y: 7, width: 10, height: 14)
        labelRank.text = "\(rank)"
        labelRank.font = .cardFont
        labelRank.textColor = color
        
        let labelSuit = UILabel()
        labelSuit.frame = CGRect(x: 7, y: 22, width: 10, height: 10 )
        labelSuit.text = "\(suit)"
        labelSuit.font = .cardFont
        labelSuit.textColor = color
        
        self.addSubview(labelSuit)
        self.addSubview(labelRank)
    }
    
}
  

extension UIFont {
    

    class var cardFont: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .semibold)
    }
    
    class var sectionLabelFont: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .semibold)
    }

    
    class var userNameFont: UIFont {
        return UIFont.systemFont(ofSize: 22.0, weight: .bold)
    }
    
    class var coinsFont: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .medium)
    }
    class var winFoldAgresFont: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .semibold)
    }
    class var sectionNameFont: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
}

extension UIColor {
  
    @nonobjc class var white: UIColor {
        return UIColor(white: 250.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var charcoalGrey8: UIColor {
        return UIColor(red: 60.0 / 255.0, green: 69.0 / 255.0, blue: 74.0 / 255.0, alpha: 0.08)
    }
    
    @nonobjc class var whiteTwo: UIColor {
        return UIColor(white: 1.0, alpha: 1.0)
    }
    
}
