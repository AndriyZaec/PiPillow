//
//  Extensions.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 28.01.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIViewController + BackButton

extension UIViewController {
    
    func customBackButton(){
        let yourBackImage = UIImage(named: "Back")
        navigationController?.navigationBar.backIndicatorImage = yourBackImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
        
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
}

//
//  Extensions.swift
//  NetherTek
//
//  Created by Andriy Zaiets on 11/9/17.
//  Copyright © 2017 Andriy Zaiets. All rights reserved.
//

import Foundation

// MARK: - UIAlertControler + AddAction

extension UIAlertController {
    
    static func alert(withTitle title: String, message: String?, style: UIAlertControllerStyle) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        return alertController
    }
    
    func addAction(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertAction = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(alertAction)
        return self
    }
    
}

// MARK: - UserDefaults + Keys

extension UserDefaults {
    
    func get(key: UserDefaultsKeys) -> Any? {
        return UserDefaults.standard.object(forKey: key.rawValue)
    }
    
    func set(value: Any? ,forKey key: UserDefaultsKeys) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    
}

// MARK: - Data + ToString

extension Data {
    
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}

// MARK: - Date + ToString

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
}

// MARK: - UIStoryboard + Extension

extension UIStoryboard {
    
    // return viewControlle from main storyboard
    static func controllerFromMainStorybourd<T>(cls: T.Type) -> T? {
        return self.controllerFromStorybourd("Main", cls: cls)
    }
    
    // return viewController based on in class from storybourd with particular name
    static func controllerFromStorybourd<R>(_ name: String, cls: R.Type) -> R? {
        let stringFromClass = String(describing: cls)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        
        return storyboard.instantiateViewController(withIdentifier: stringFromClass) as? R
    }
    
    static func initialControllerFromStorybourd<R>(_ name: String) -> R? {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateInitialViewController() as? R
    }
    
    class func viewController(_ storyboard: String, identifier: String) -> UIViewController {
        return UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
}


