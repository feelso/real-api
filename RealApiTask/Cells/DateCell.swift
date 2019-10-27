//
//  DateCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/22/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class DateCell: UICollectionViewCell {

    @IBOutlet weak var opponentsDate: UILabel!
    @IBOutlet weak var sectionName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    
    func setups() {
        opponentsDate.font = .dateStyle
        if let model = InfoModel.singleCellModel[String(describing: DateCell.self)] as? DateCellModel {
            if let timeFrom = model.registrationDay {
                let date = Date(timeIntervalSince1970: TimeInterval(timeFrom))
                let calendar = Calendar.current
                let day = calendar.component(.day, from: date)
                let year = calendar.component(.year, from: date)
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM"
                let month = dateFormatter.string(from: date)
                let first3 = String(month.prefix(3))
                
                opponentsDate.text = "\(day) \(first3), \(year)"
                sectionName.font = .sectionLabelFont
            }
        }
    }
}

class DateCellModel: DataModel {
    var registrationDay: Int?
}


extension UIFont {
    class var dateStyle: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
    }
}
