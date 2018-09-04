//
//  UserInfoViewController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 13.04.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func dismissSelf(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Privates
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        containerView.layer.cornerRadius = 15
        containerView.clipsToBounds = true
    }
    
}
