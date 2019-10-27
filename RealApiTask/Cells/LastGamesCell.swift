//
//  LastGamesCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/22/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class LastGamesCell: UICollectionViewCell {

    @IBOutlet var winLossOpponentLabels: [UILabel]!
    @IBOutlet var rebBlueOpponentSquares: [UIView]!
    @IBOutlet weak var sectionName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sectionName.font = .sectionLabelFont
    }

    enum GameResult: Int {
        
        case loss = 0
        case win = 1
        
        var stringValue: String {
            switch self {
            case .loss:
                return "L"
            case .win:
                return "W"
            }
        }
        
        var squareColor: UIColor {
            switch self {
            case .loss:
                return .salmon
            case .win:
                return .brightSkyBlue
            }
        }
        
    }
    
    
    func setups() {
        if let model = InfoModel.singleCellModel[String(describing: LastGamesCell.self)] as? LastGamesCellModel {
            if let games = model.games {
                var i = 0
                var e = 0

                for square in rebBlueOpponentSquares  {
                    let game = GameResult(rawValue: games[i])
                    square.layer.cornerRadius = 4
                    square.backgroundColor = game?.squareColor
                    i += 1
                }
                
                for label in winLossOpponentLabels  {
                    let game = GameResult(rawValue: games[e])
                    label.font = .textStyle4
                    label.text = game?.stringValue
                    e += 1
                }
            }
            
        }
    }
}



class LastGamesCellModel: DataModel {
    var games: [Int]?
}



extension UIFont {
    class var textStyle4: UIFont {
        return UIFont.systemFont(ofSize: 12.0, weight: .semibold)
    }
}
extension UIColor {
@nonobjc class var brightSkyBlue: UIColor {
    return UIColor(red: 1.0 / 255.0, green: 181.0 / 255.0, blue: 1.0, alpha: 1.0)
}
}
