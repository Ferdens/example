//
//  WelcomeViewController.swift
//  Service
//
//  Created by anton Shepetuha on 07.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class WelcomeViewController: UIViewController {
    
    let loaderView = LOTAnimationView(name: "loaderAnimation", bundle: Bundle.main)
    
    // MARK: - Controller lifecycle
    
   override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { (_) in
            User.logout(completionHandler: { (error) in
                if let error = error {
                    SimpleAlert.showAlert(alert: error, delegate: self)
                } else {
                    AppConstants.appDelegate.openStartScreen()
                }
            })
        }
    }
    
    // MARK: - Help methods

}
