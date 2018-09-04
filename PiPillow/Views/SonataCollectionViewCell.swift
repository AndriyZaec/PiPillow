//
//  SonataCollectionViewCell.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 21.05.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class SonataCollectionViewCell: BaseSleepCollectionViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var sonataSlider: PRGRoundSlider!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.sonataSlider.layoutIfNeeded()
    }
    
    // MARK: - Actions
    
    @IBAction func nextDidTapped(_ sender: UIButton) {
        delegate?.setUpSonataTime(time: Int(sonataSlider.value) / 60)
    }
    
    @IBAction func skipDidTapped(_ sender: UIButton) {
        delegate?.skipDidTapped()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
        
        skipButton.layer.cornerRadius = 15
        skipButton.clipsToBounds = true
        
        nextButton.layer.cornerRadius = 15
        nextButton.clipsToBounds = true
        
        sonataSlider.messageColor = .white
        sonataSlider.messageForValue = { (value) in
            let hours = Int(value*200)/60
            if hours > 0 {
                return "\(hours) hr"
            } else {
                return "Automatically"
            }
        }
        sonataSlider.value = 0.5
    }
}
