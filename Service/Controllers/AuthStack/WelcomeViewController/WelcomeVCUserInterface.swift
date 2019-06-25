//
//  WelcomeVCUserInterface.swift
//  Service
//
//  Created by anton Shepetuha on 07.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import Lottie

extension WelcomeViewController {
    
    func setupUI() {
        
        hideKeyboardOnTap()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: .clear), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.view.backgroundColor = .white
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
        
        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = #imageLiteral(resourceName: "loginCircles")
        self.view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

        loaderView.translatesAutoresizingMaskIntoConstraints = false
        loaderView.play()
        loaderView.loopAnimation = true
        self.view.addSubview(loaderView)
        loaderView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loaderView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loaderView.heightAnchor.constraint(equalToConstant: 90).isActive = true
        loaderView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
    }
    
}
