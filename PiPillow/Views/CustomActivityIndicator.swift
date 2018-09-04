//
//  CustomActivityIndicator.swift
//  NetherTek
//
//  Created by Andriy Zaiets on 2/9/18.
//  Copyright © 2018 Andriy Zaiets. All rights reserved.
//

import Foundation
import UIKit

open class CustomActivityIndicator {
	
	var containerView = UIView()
	var progressView = UIView()
	var activityIndicator = UIActivityIndicatorView()
	
	open class var shared: CustomActivityIndicator {
		struct Static {
			static let instance: CustomActivityIndicator = CustomActivityIndicator()
		}
		return Static.instance
	}
	
	open func showActivityIndicator(_ view: UIView) {
		containerView.frame = view.frame
		containerView.center = view.center
		containerView.backgroundColor = UIColor(white: 0, alpha: 0.5)
		
		progressView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
		progressView.center = view.center
		progressView.backgroundColor = UIColor(hex: 0x444444, alpha: 0.7)
		progressView.clipsToBounds = true
		progressView.layer.cornerRadius = 10
		
		activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
		activityIndicator.activityIndicatorViewStyle = .whiteLarge
		activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
		
		progressView.addSubview(activityIndicator)
		containerView.addSubview(progressView)
		view.addSubview(containerView)
		
		activityIndicator.startAnimating()
	}
	
	open func hideActivityIndicator() {
		activityIndicator.stopAnimating()
		containerView.removeFromSuperview()
	}
}

extension UIColor {
	
	@objc convenience init(hex: UInt32, alpha: CGFloat) {
		let red = CGFloat((hex & 0xFF0000) >> 16)/256.0
		let green = CGFloat((hex & 0xFF00) >> 8)/256.0
		let blue = CGFloat(hex & 0xFF)/256.0
		
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
}
