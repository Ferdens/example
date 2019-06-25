//
//  BottomBorderTextField.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import UIKit

class BottomBorderTextField : UITextField {
    
    let border       = CALayer()
    var borderColor  : UIColor?
    let warningLabel = UILabel()
    var warningText  = "Please, enter valid email"
    var isValid      = false {
        didSet{
            if !self.isValid {
                warningLabel.isHidden = false
                border.borderColor = AppColors.serviceTomato.cgColor
                self.rightViewMode = .whileEditing
            } else {
                warningLabel.isHidden = true
                border.borderColor = borderColor?.cgColor ?? AppColors.serviceLightGrey.cgColor
            }
        }
    }
    
    func drawBorder() {
        let width = CGFloat(1.0)
        border.borderColor = borderColor?.cgColor ?? AppColors.serviceLightGrey.cgColor
        border.frame = CGRect(x: 0,
                              y: self.frame.size.height + 2,
                              width: self.frame.size.width,
                              height: 0.9)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = false
    }
    
    override func draw(_ rect: CGRect) {
        drawBorder()
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.isHidden = true
        warningLabel.text = warningText
        warningLabel.font = UIFont.systemFont(ofSize: 12)
        warningLabel.textColor = AppColors.serviceTomato
        self.addSubview(warningLabel)
        warningLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        warningLabel.topAnchor.constraint(equalTo: self.bottomAnchor,constant: 12).isActive = true
    }
    
}
