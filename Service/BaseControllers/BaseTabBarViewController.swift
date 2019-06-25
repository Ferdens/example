//
//  BaseTabBarViewController.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarViewController: UITabBarController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupTabBar()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = AppColors.servicePurpleishBlue
        self.tabBar.barTintColor = UIColor.white.withAlphaComponent(0.9)
    }
    
    func setupTabBar() { }
    
}
