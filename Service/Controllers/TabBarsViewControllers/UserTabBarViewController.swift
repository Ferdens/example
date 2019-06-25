//
//  UserTabBarViewController.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class UserTabBarViewController: BaseTabBarViewController, UITabBarControllerDelegate {

    override func setupTabBar() {
        
        var viewControllers = [UIViewController]()
        let searchVC = UINavigationController(rootViewController: SearchViewController())
        let searchItem = UITabBarItem(title: "Search", image: #imageLiteral(resourceName: "searchTabBar"), selectedImage: #imageLiteral(resourceName: "searchTabBarSelected"))
        searchItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : AppColors.serviceTabBarGrey], for: .normal)
        searchItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : AppColors.servicePurpleishBlue], for: .selected)
        searchVC.tabBarItem = searchItem
        
        viewControllers.append(searchVC)
        
        let favouriteVC = UINavigationController(rootViewController: UIViewController())
        let favouriteItem = UITabBarItem(title: "Favourite", image: #imageLiteral(resourceName: "heartTabBar"), selectedImage: #imageLiteral(resourceName: "heartTabBarSelected"))
        
        favouriteItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : AppColors.serviceTabBarGrey], for: .normal)
        favouriteItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : AppColors.servicePurpleishBlue], for: .selected)
        favouriteVC.tabBarItem = favouriteItem
        viewControllers.append(favouriteVC)
        
        
        let popularVC = UINavigationController(rootViewController: UIViewController())
        let popularItem = UITabBarItem(title: "Popular", image: #imageLiteral(resourceName: "starTabBar"), selectedImage: #imageLiteral(resourceName: "starTabBarSelected"))
        popularItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : AppColors.serviceTabBarGrey], for: .normal)
        popularItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : AppColors.servicePurpleishBlue], for: .selected)
        popularVC.tabBarItem = popularItem
        
        viewControllers.append(popularVC)
        
        let settingsVC = UINavigationController(rootViewController: UIViewController())
        let settingsItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "settingsTabBar"), selectedImage: #imageLiteral(resourceName: "settingsTabBarSelected"))
        settingsItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : AppColors.serviceTabBarGrey], for: .normal)
        settingsItem.setTitleTextAttributes([NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue) : AppColors.servicePurpleishBlue], for: .selected)
        settingsVC.tabBarItem = settingsItem
        
        viewControllers.append(settingsVC)
        
        //        let separatorView = UIView(frame: CGRect(x: 0, y: 0, width: AppConstants.screenWidth, height: 1))
        //        separatorView.backgroundColor = AppConstants.isDarkTheme() ? UIColor(red: 34, green: 34, blue: 34) : UIColor(red: 35, green: 42, blue: 64)
        //        self.tabBar.addSubview(separatorView)
        //        self.tabBar.insertSubview(UIImageView(image: UIImage.imageFromColor(color: AppConstants.residentTabBarColor, rect: CGRect(x: 0, y: 0, width: AppConstants.screenWidth, height: 55))), at: 0)
        
        self.viewControllers = viewControllers
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        return true
    }
    
}
