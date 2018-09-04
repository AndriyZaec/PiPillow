//
//  OnBoardingViewController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 28.01.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Privates
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        applyMotionEffect(toView: backgroundImageView, magnitude: 20)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func applyMotionEffect(toView view: UIView, magnitude: Float) {
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = magnitude
        xMotion.maximumRelativeValue = -magnitude
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = magnitude
        yMotion.maximumRelativeValue = -magnitude
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [xMotion, yMotion]
        view.addMotionEffect(group)
    }
}
