//
//  BottomBorderButton.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class BottomBorderButton: UIButton {
    
    let border = CALayer()
    var borderColor: UIColor?
    
    func drawBorder() {
        let width = CGFloat(1.0)
        border.borderColor = borderColor?.cgColor ?? UIColor(red: 223, green: 223, blue: 228).cgColor
        border.frame = CGRect(x: 0,
                              y: self.frame.size.height - width - 6,
                              width: self.frame.size.width,
                              height: 2)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = false
    }
    
    override func draw(_ rect: CGRect) {
        drawBorder()
    }
    
}
