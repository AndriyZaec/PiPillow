//
//  EasyWakeCollectionViewCell.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 17.05.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class EasyWakeCollectionViewCell: BaseSleepCollectionViewCell {

    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var easyWakeRangeSlider: PRGRoundRangeSlider!
    
    private var easyWakeStartBorderTime: Date?
    private var easyWakeEndBorderTime: Date?
    
    private var easyWakeHighBorderAlarmTime: Date?
    private var easyWakeLowBorderAlarmTime: Date?
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        easyWakeRangeSlider._startValue = 0.3
        easyWakeRangeSlider._endValue = 0.7
        easyWakeRangeSlider.messageColor = .white
    }
    
    // MARK: - Actions
    
    @IBAction func nextDidTapped(_ sender: UIButton) {
        delegate?.setEasyWakeRange(startAlarmTime: easyWakeHighBorderAlarmTime!, endAlarmTime: easyWakeLowBorderAlarmTime!)
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
        
        easyWakeRangeSlider.messageColor = .white
    }
    
    func configureCell(withalarmTime alarm: Date) {
        easyWakeStartBorderTime = alarm.addingTimeInterval(TimeInterval.init(-60*60))
        easyWakeEndBorderTime = alarm.addingTimeInterval(TimeInterval.init(60*60))
        let startTimeString = easyWakeStartBorderTime?.toString(dateFormat: "HH:mm")
        let endTimeString = easyWakeEndBorderTime?.toString(dateFormat: "HH:mm")
        easyWakeRangeSlider.startText = startTimeString ?? ""
        easyWakeRangeSlider.endText = endTimeString ?? ""
        
        easyWakeRangeSlider.messageForValue = { (startValue,endValue) in
            
            let easyWakeStartTimeMagnitude = self.easyWakeStartBorderTime!
                .timeIntervalSince(self.easyWakeEndBorderTime!) * Double(-startValue)
            let easyWakeEndTimeMagnitude = self.easyWakeStartBorderTime!
                .timeIntervalSince(self.easyWakeEndBorderTime!) * Double(-endValue)
            
            let startEasyWakeTime = self.easyWakeStartBorderTime?.addingTimeInterval(easyWakeStartTimeMagnitude)
            let endEasyWakeTime = self.easyWakeStartBorderTime?.addingTimeInterval(easyWakeEndTimeMagnitude)
            
            self.easyWakeHighBorderAlarmTime = startEasyWakeTime
            self.easyWakeLowBorderAlarmTime = endEasyWakeTime
            
            return "\(startEasyWakeTime!.toString(dateFormat: "HH:mm")) - \(endEasyWakeTime!.toString(dateFormat: "HH:mm"))"
        }
        
        easyWakeRangeSlider.layoutIfNeeded()
    }

}
