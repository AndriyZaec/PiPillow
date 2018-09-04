//
//  RegistrationViewController.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 04.02.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit
import Moya
import KeychainAccess

class RegistrationViewController: UIViewController {

    //MARK: - Properties
    @IBOutlet weak var nameTextField: UnderlineTextField!
    @IBOutlet weak var emailTextField: UnderlineTextField!
    @IBOutlet weak var passTextField: UnderlineTextField!
    @IBOutlet weak var repeatPassTextfField: UnderlineTextField!
    
    @IBOutlet weak var agreementButton: UIButton!
    
    var isPrivacyAccepted = false
    
    let showPairingSegueId = "showPairing"
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func agreementAction(_ sender: UIButton) {
        isPrivacyAccepted = !isPrivacyAccepted
        
        if isPrivacyAccepted {
            agreementButton.setImage(#imageLiteral(resourceName: "accept"), for: .normal)
        } else {
            agreementButton.setImage(#imageLiteral(resourceName: "oval"), for: .normal)
        }
    }
    
    @IBAction func registerAction(_ sender: UIButton) {
        
        CustomActivityIndicator.shared.showActivityIndicator(self.view)
        
        guard !emailTextField.text!.isEmpty, !nameTextField.text!.isEmpty, !passTextField.text!.isEmpty, isPrivacyAccepted else {
            
            let alert = UIAlertController.alert(withTitle: "Some fields are empty.", message: "All fields are required. Please, fill all fileds", style: .alert)
                .addAction(title: "OK", style: .default, handler: nil)
            present(alert, animated: true, completion: nil)
            
            CustomActivityIndicator.shared.hideActivityIndicator()
            
            return
        }
        
        registerRequest(emailTextField.text!, password: passTextField.text!, name: nameTextField.text!)
        
    }
    
    //MARK: - Privates
    
    func registerRequest(_ email: String, password: String, name: String) {
        let provider = MoyaProvider<PiPillowAPIService>() //(plugins: [NetworkLoggerPlugin()])
        
        provider.request(.register(email: email, password: password, name: name)) { [unowned self] result in
            do {
                switch result {
                case .success(let response):
                    if response.statusCode >= 200 && response.statusCode <= 300 {
                
                        if let responseData = result.value?.data {
                            let parsedResponse = try JSONDecoder().decode(RegisterResponse.self, from: responseData)
                            if parsedResponse.status == "ok" {
                                let keychain = Keychain(server: BASE_URL, protocolType: .http)
                                keychain[email] = parsedResponse.token
                                self.performSegue(withIdentifier: self.showPairingSegueId, sender: self)
                            }
                        }
                    }
                case .failure(let error):
                        print("ERROR registration (RegistrationViewController): \(error)")
                }
            } catch {
                let alert = UIAlertController.alert(withTitle: "Oops some we have some troubles, try later.", message: nil, style: .alert)
                    .addAction(title: "OK", style: .default, handler: nil)
                self.present(alert, animated: true, completion: nil)
            }
            CustomActivityIndicator.shared.hideActivityIndicator()
        }
    }
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {

    }
    
}
