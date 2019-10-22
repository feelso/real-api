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
    @IBOutlet weak var userBalanceLabel: UILabel!
    @IBOutlet weak var userFriendsInfoLabel: UILabel!
    @IBOutlet weak var addFriendButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        self.avatarImage.layer.cornerRadius = 50
        self.avatarImage.backgroundColor = .red
        
        self.addFriendButton.layer.cornerRadius = 25
    }


}
