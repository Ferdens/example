//
//  UIImage.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    class func imageFromColor(color: UIColor, rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)) -> UIImage? {
        let rect = rect
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
