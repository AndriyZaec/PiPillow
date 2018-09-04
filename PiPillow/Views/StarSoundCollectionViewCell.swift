//
//  StarSoundCollectionViewCell.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 21.05.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class StarSoundCollectionViewCell: BaseSleepCollectionViewCell {

    // MARK: - Properties
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var soundPicker: UIPickerView!
    
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var soundArray = StarSoundElements
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    // MARK: - Actions
    
    @IBAction func nextDidTapped(_ sender: UIButton) {
        let sound = soundArray[soundPicker.selectedRow(inComponent: 0)]
        delegate?.setUpStarSound(with: sound)
    }
    
    @IBAction func skipDidTapped(_ sender: UIButton) {
        delegate?.setUpStarSound(with: nil)
        delegate?.skipDidTapped()
    }
    
    // MARK: - UI
    
    private func setupUI() {
        
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
        
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        if let starSoundImageName = soundArray.first {
            imageView.image = UIImage(named: starSoundImageName.replacingOccurrences(of: " ", with: "_"))
        }
        coverView.clipsToBounds = true
        
        skipButton.layer.cornerRadius = 15
        skipButton.clipsToBounds = true
        
        nextButton.layer.cornerRadius = 15
        nextButton.clipsToBounds = true
        
        soundPicker.delegate = self
        soundPicker.dataSource = self
        
        containerView.layoutIfNeeded()
    }

}

extension StarSoundCollectionViewCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: soundArray[row], attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
    }
    
}

extension StarSoundCollectionViewCell: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return soundArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let innerView = UIView(frame: CGRect(x: 0,
                                             y: 0,
                                             width: pickerView.rowSize(forComponent: component).width,
                                             height: pickerView.rowSize(forComponent: component).height))
        
        let botDivideView = UIView(frame: CGRect(x: 0,
                                                 y: pickerView.rowSize(forComponent: component).height - 1,
                                                 width: pickerView.rowSize(forComponent: component).width,
                                                 height: 1))
        botDivideView.backgroundColor = .white
        innerView.addSubview(botDivideView)
        let label = UILabel(frame: innerView.frame)
        label.text = soundArray[row]
        label.textColor = .white
        label.font = UIFont(name: "Roboto-Regular", size: 20)
        label.textAlignment = .center
        innerView.addSubview(label)
        return innerView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 70
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let starSoundImage = UIImage(named: self.soundArray[row].replacingOccurrences(of: " ", with: "_"))
        UIView.transition(with: self.imageView,
                          duration:0.5,
                          options: .transitionCrossDissolve,
                          animations: { self.imageView.image = starSoundImage },
                          completion: nil)
    }
}
