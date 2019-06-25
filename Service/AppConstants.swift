//
//  AppConstants.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

enum Device: Int {
    case iPhoneX = 812
    case iPhone5 = 568
    case iPhonePlus = 736
    case iPhone6
    case iPad
    
    static func getCurrentDevice() -> Device {
        switch AppConstants.screenHeight {
        case 812:
            return Device.iPhoneX
        case 568:
            return Device.iPhone5
        case 736:
            return Device.iPhonePlus
        default:
            if AppConstants.isiPad {
                return Device.iPad
            } else {
                return Device.iPhone6
            }
        }
    }
}

class AppConstants {
    
    static let currentUserTokenUserDeaultKey = "currentUserTokenUserDeaultKey"
    static let currentUserIdKey = "currentUserIdKey"
    
    static var api: String {
        return "http://178.128.207.215:4040"
    }
    
    static let googleAPIKey = "AIzaSyD-t6l3b98ERhpfwa4epxEQ17IK4o49Gwc"
    
    static var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    static let screenSize      = UIScreen.main.bounds
    static let screenWidth     = UIScreen.main.bounds.size.width
    static let screenHeight    = UIScreen.main.bounds.size.height
    static let statusBarHeight = UIApplication.shared.statusBarFrame.height
    
    static var isiPad: Bool {
        return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
    }
    
    static func attributedStringWith(font: UIFont, color: UIColor, text: String) -> NSAttributedString {
        let string = NSMutableAttributedString()
        let attributes = [NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.font: font]
        string.append(NSAttributedString(string: text, attributes: attributes))
        return string
    }
    
    static var targetName: String? {
        guard let dictionary = Bundle.main.infoDictionary, let targetName = dictionary["TargetName"] as? String else { return nil }
        return targetName
    }
    
    static func heitiMediumFontWith(scale: CGFloat) -> UIFont? {
        return UIFont(name: "STHeitiSC-Medium", size: scale)
    }
    
    static func maisonneueFontWith(scale: CGFloat) -> UIFont? {
        return UIFont(name: "maisonneue", size: scale)
    }
    
    // MARK: - UserDefaults keys
    
    static let remindersUserDefaultsKey = "reminders"
    
}
