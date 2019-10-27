//
//  CardModel.swift
//  RealApiTask
//
//  Created by Arsen on 10/26/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
import UIKit
import Foundation

class Card: UIView {

    override func draw(_ rect: CGRect) {
        
        let shapeLayer = CAShapeLayer()
        
        let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height), cornerRadius: 2)
       
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.shadowRadius = 4
        shapeLayer.shadowColor = UIColor.charcoalGrey8.cgColor
        shapeLayer.shadowOffset = CGSize(width: 10, height: 10)
        shapeLayer.shadowPath = path.cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
    func handleCardData(suit: Int, rank: Int) -> (Suit?, CardValues?) {
        guard (1...4).contains(suit) else { return (nil, nil)}
        guard (2...14).contains(rank) else { return (nil, nil)}
        
        let suitt = Suit(rawValue: suit)
        let rankk = CardValues(rawValue: rank)
        return (suitt, rankk)
    }
    

    func fillRankAndSuit(suit: Int?, rank: Int?) {
        if let suit = suit, let rank = rank {
            let data = handleCardData(suit: suit, rank: rank)
            
            if let suitt = data.0, let rank = data.1 {
                DispatchQueue.main.async {
                    self.fillCard(rank: rank.stringValue, suit: suitt.suitSymbol, color: suitt.textColor)
                }
            }
        }
 
    }
    
}

    enum Suit: Int {
        case spade = 1
        case clubs = 2
        case diamonds = 3
        case heards = 4
        
        var suitSymbol: String {
            switch self {
            case .spade:
                return "♠"
            case .clubs:
                return "♣"
            case .diamonds:
                return "♦"
            case .heards:
                return "♥"
            }
        }
        
        var textColor: UIColor {
            switch self {
            case .spade:
                return UIColor.black
            case .clubs:
                return UIColor.black
            case .diamonds:
                return UIColor.red
            case .heards:
                return UIColor.red
           
            }
        }
        
    }
    enum CardValues: Int, CaseIterable {
        case two = 2
        case three = 3
        case four = 4
        case five = 5
        case six = 6
        case seven = 7
        case eight = 8
        case nine = 9
        case ten = 10
        case jocker = 11
        case queen = 12
        case king = 13
        case ace = 14
        
        var stringValue: String {
            switch self {
            case .two:
                return "2"
            case .three:
                return "3"
            case .four:
                return "4"
            case .five:
                return "5"
            case .six:
                return "6"
            case .seven:
                return "7"
            case .eight:
                return "8"
            case .nine:
                return "9"
            case .ten:
                return "10"
            case .jocker:
                return "J"
            case .queen:
                return "Q"
            case .king:
                return "K"
            case .ace:
                return "A"
            }
        }
    }

