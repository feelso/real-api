//
//  UserInfoCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/20/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class UserInfoCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var coinsImage: UIImageView!
    @IBOutlet weak var coinsLabel: UILabel!
    @IBOutlet weak var userFriendsInfoLabel: UILabel!
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var subscriptionImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.avatarImage.layer.cornerRadius = avatarImage.frame.width/2
        self.addFriendButton.layer.cornerRadius = 25
    }
    
    func setup() {
        if let model = InfoModel.singleCellModel[String(describing: UserInfoCell.self)] as? UserInfoCellModel{
            
                self.avatarImage.image = model.avatarImage
                self.userNameLabel.text = model.userName
                self.userNameLabel.font = .userNameFont
                
                if let coin = model.coins {
                    self.coinsImage.isHidden = false
                    self.coinsLabel.text = "\(coin)"
                    self.coinsLabel.font = .coinsFont
                }
                
                if let subs = model.subscribed  {
                    _ = subs ? (self.subscriptionImage.isHidden = false) : (self.subscriptionImage.isHidden = true)
                    
                }
                
                if let online = model.isOnline {
                    var condition = ""
                    _ = online ? (condition = "online") : (condition = "offline")
                    let text = "\(condition) | 11 friends |  10 mutual friends"
                    self.userFriendsInfoLabel.text = text
                }
                
        }
    }
    
}

class UserInfoCellModel: DataModel {
    
    var avatarImage: UIImage?
    var userName: String?
    var coins: Int?
    var isOnline: Bool?
    var subscribed: Bool?
    
}
