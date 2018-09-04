//
//  NightStatisticCollectionViewCell.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 30.06.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit
import UICircularProgressRing

class NightStatisticCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var circularView: UICircularProgressRingView! {
        didSet {
            circularView.gradientColors = [.cyan,.gray]
            circularView.layoutIfNeeded()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
