//
//  UserGameStyleCell.swift
//  RealApiTask
//
//  Created by Arsen on 10/21/19.
//  Copyright © 2019 Arsen. All rights reserved.
//
private let orangeProgressColor = #colorLiteral(red: 0.936629653, green: 0.3862282634, blue: 0.2134254575, alpha: 1)
private let orangeTrackColor = #colorLiteral(red: 0.9607239366, green: 0.682874918, blue: 0.535238266, alpha: 1)

private let foldProgressColor = #colorLiteral(red: 0.9673269391, green: 0.7128084302, blue: 0.2642357051, alpha: 1)
private let foldTrackColor = #colorLiteral(red: 0.9803141952, green: 0.8231377006, blue: 0.5190894604, alpha: 1)

private let winProgressColor = #colorLiteral(red: 0.2858526707, green: 0.7364905477, blue: 0.9736801982, alpha: 1)
private let winTrackColor = #colorLiteral(red: 0.488024354, green: 0.8626107574, blue: 0.9807172418, alpha: 1)

import UIKit

class UserGameStyleCell: UICollectionViewCell {

    @IBOutlet weak var agressionLabel: UILabel!
    @IBOutlet weak var foldRateLabel: UILabel!
    @IBOutlet weak var winRateLabel: UILabel!
    
    @IBOutlet weak var foldProgressView: UIProgressView!
    
    @IBOutlet weak var winRateProgressView: UIProgressView!
    
    @IBOutlet weak var agressionProgressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupProgressesWith(progressView: agressionProgressView, progressColor: orangeProgressColor, trackColor:    orangeTrackColor, progress: 0.55)
        setupProgressesWith(progressView: foldProgressView, progressColor: foldProgressColor, trackColor: foldTrackColor, progress: 0.24)
        setupProgressesWith(progressView: winRateProgressView, progressColor: winProgressColor, trackColor: winTrackColor, progress: 0.63)
        
    }
    
    func setupProgressesWith(progressView: UIProgressView,progressColor: UIColor, trackColor: UIColor, progress: CGFloat ) {
        
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 3)
        progressView.progress = 0.5
        progressView.progressTintColor = progressColor
        progressView.trackTintColor = trackColor
        progressView.layer.cornerRadius = 4
        progressView.clipsToBounds = true
    }

}
