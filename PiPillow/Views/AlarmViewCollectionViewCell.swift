//
//  AlarmViewCollectionViewCell.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 15.05.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class AlarmViewCollectionViewCell: BaseSleepCollectionViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: - Actions
    
    @IBAction func nextDidTapped(_ sender: UIButton) {
        delegate?.setUpAlalrm(withDate: timePicker.date)
        delegate?.nextDidTapped()
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
        
        timePicker.setValue(UIColor.white, forKey: "textColor")
    }

}
