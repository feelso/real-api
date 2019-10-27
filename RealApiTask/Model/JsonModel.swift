//
//  JsonModel.swift
//  RealApiTask
//
//  Created by Arsen on 10/20/19.
//  Copyright © 2019 Arsen. All rights reserved.
//


import Foundation
import UIKit

struct CustomJson: Codable {
    
    let userId: Int
    let profilePic: String
    let duelProgress: [DuelProgress]
    let coins: Int
    let name: String
    let isOnline: Bool
    let subscribed: Bool
    let winRate: Double
    let foldRate: Double
    let aggression: Double
    let registrationDay: Int
    let bestHand: [BestHand]
    let rankProgress: RankProgress
    let form: [Int]
   
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case profilePic = "profile_pic"
        case duelProgress = "duel_progress"
        case coins
        case name
        case isOnline = "is_online"
        case subscribed = "subscription_active"
        case winRate = "win_rate"
        case aggression
        case foldRate = "fold_rate"
        case registrationDay = "registration_day"
        case bestHand = "best_hand"
        case rankProgress = "rank_progress"
        case form
    }
    
}
struct RankProgress: Codable {
    let rankInfo: RankInfo
    
    enum CodingKeys: String, CodingKey {
        case rankInfo = "rank_info"
    }
}

struct RankInfo: Codable {
    let name: String
}

struct BestHand: Codable {
    let rank: Int
    let suit: Int
}

struct DuelProgress: Codable {

    let badge: String
    let badgeRibbon: String
    let duelAchievements: DuelAchievements
    
    enum CodingKeys: String, CodingKey {
        case badge
        case badgeRibbon = "badge_ribbon"
        case duelAchievements = "duel_achievements"
    }
}

struct DuelAchievements: Codable {
    
    let completedStars: Int
    
    enum CodingKeys: String, CodingKey {
        case completedStars = "completed_minor_achievements"
    }
}
