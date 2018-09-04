//
//  LogInViewController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 28.01.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var logoHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var emaulTextField: UnderlineTextField!
    @IBOutlet weak var passTextField: UnderlineTextField!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func logInAction(_ sender: UIButton) {
    }
    
    @IBAction func forgotPassAction(_ sender: UIButton) {
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
    }
    
    //MARK: - Privates
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        
    }

}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //self.logoHeightConstraint.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutSubviews()
        }
        return true
    }
    
}
