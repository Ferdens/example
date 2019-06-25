//
//  UIView.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadow(opacity: Float, radius: CGFloat, withCornerRadius: CGFloat = 0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = radius
    }
    
    func addShadowForRoundedView(opacity: Float, radius: CGFloat) {
        guard let superView = self.superview else {
            #if DEBUG
                assert(false, "No superview for current view")
            #endif
            return
        }
        let shadowView = UIView()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        shadowView.backgroundColor = .white
        shadowView.addShadow(opacity: opacity, radius: radius, withCornerRadius: self.layer.cornerRadius)
        superView.addSubview(shadowView)
        shadowView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        shadowView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        shadowView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        shadowView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
        superView.sendSubview(toBack: shadowView)
    }
    
}
