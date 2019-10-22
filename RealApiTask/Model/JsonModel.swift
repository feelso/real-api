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
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case profilePic = "profile_pic"
        case duelProgress = "duel_progress"
    }
    
}

struct DuelProgress: Codable {

    let week_participants: Int
    let badge: String
    
}
