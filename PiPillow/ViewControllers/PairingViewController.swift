//
//  PairingViewController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 04.02.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class PairingViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var pillowImageView: UIImageView!
    @IBOutlet weak var pillowImageLeading: NSLayoutConstraint!
    @IBOutlet weak var pillowImageTrailing: NSLayoutConstraint!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    let firstStepTitle = "Connect PiPillow to your smartphone."
    let firstStepSubtitle = "Make sure bluetooth on your phone and PiPillow are turned on."
    
    let secondStepTitle = "Put PiPillow into pairing mode"
    let secondStepSubtitle = "Make sure that PiPillow is on and hold FlashTouch until it flashes with blue colour."
    
    let thirdStepTitle = "Sucssesfully conected with the PiPillow."
    let thirdStepSubtitle = "Congratulations"
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateMovingPillow()
        
        animateTitles(with: firstStepTitle, subtitleText: firstStepSubtitle)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        hidePillow()
    }
    
    //MARK: - Actions
    
    @IBAction func connectAction(_ sender: UIButton) {
        switch pageControl.currentPage {
        case 0:
            prepareForSecondStepPairing()
        case 1:
            prepareForThirdStepPairing()
        default: break
        }
    }
    
    //MARK: - Privates
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        titleLabel.layer.opacity = 0
        subtitleLabel.layer.opacity = 0
    }
    
    private func updateUI() {
    
    }
    
    private func animateTitles(with titleText: String, subtitleText: String) {
        UIView.animate(withDuration: 0.8) {
            self.titleLabel.layer.opacity    = 0
            self.subtitleLabel.layer.opacity = 0
            
            self.titleLabel.text    = titleText
            self.subtitleLabel.text = subtitleText
            
            self.titleLabel.layer.opacity    = 1
            self.subtitleLabel.layer.opacity = 1
        }
    }
    
    private func animateMovingPillow() {
        pillowImageLeading.constant = -420
        pillowImageTrailing.constant = 0
        UIView.animate(withDuration: 40, delay: 0, options: [.repeat,.autoreverse], animations: {
            self.view.layoutSubviews()
        }, completion: nil)
    }
    
    private func hidePillow() {
        UIView.animate(withDuration: 0.05) {
            self.pillowImageView.layer.opacity = 0
            self.view.layoutIfNeeded()
        }
    }
    
    private func prepareForSecondStepPairing() {
        pageControl.currentPage = 1
        animateTitles(with: secondStepTitle, subtitleText: secondStepSubtitle)
    }
    
    private func prepareForThirdStepPairing() {
        pageControl.currentPage = 2
        animateTitles(with: thirdStepTitle, subtitleText: thirdStepSubtitle)
    }
    
}
