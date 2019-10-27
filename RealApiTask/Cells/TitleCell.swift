//
//  TitleCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/22/19.
//  Copyright © 2019 Arsen. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    @IBOutlet weak var sectionName: UILabel!
    @IBOutlet weak var userTitle: UILabel!
    @IBOutlet weak var opponentsTitle: UILabel!
    
    func setups() {
        if let model = InfoModel.singleCellModel[String(describing: TitleCell.self)] as? TitleCellModel{
            DispatchQueue.main.async {
                self.opponentsTitle.text = model.name
            }
        }
        sectionName.font = .sectionLabelFont
    }
}

class TitleCellModel: DataModel {
    var name: String?
}
