//
//  ReportAbuseCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/23/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class ReportAbuseCell: UICollectionViewCell {

    
    @IBOutlet weak var reportAbuseLabel: UILabel!
   
    @IBOutlet weak var bottomHiderView: UIButton!
   
    override func awakeFromNib() {
        super.awakeFromNib()

        bottomHiderView.layer.cornerRadius = 3
        reportAbuseLabel.textColor = .salmon
        reportAbuseLabel.font = .reportAbuseFont
    }

}





extension UIColor {
    
    @nonobjc class var salmon: UIColor {
        return UIColor(red: 1.0, green: 115.0 / 255.0, blue: 115.0 / 255.0, alpha: 1.0)
    }
    

    
}

extension UIFont {
    class var reportAbuseFont: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .bold)
    }
}
