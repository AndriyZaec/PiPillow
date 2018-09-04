//
//  UnderlineTextField.swift
//  PiPillow
//
//  Created by Andrew Zaiets on 02.02.18.
//  Copyright © 2018 pi-company. All rights reserved.
//

import UIKit

@IBDesignable
class UnderlineTextField: UITextField {
    
    let border = CALayer()
    
    override func draw(_ rect: CGRect) {
        let width = CGFloat(0.8)
        border.borderColor = #colorLiteral(red: 0.4196078431, green: 0.4470588235, blue: 0.4941176471, alpha: 1)
        border.borderWidth = 1
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width + 10, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

}
