
//
//  SimpleAlert.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class SimpleAlert {
    @discardableResult static func showAlert(title: String? = nil, alert: String, delegate: UIViewController, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let titleString: String
        
        if let title = title {
            titleString = title
        } else {
            titleString = ""
        }
        
        let alertController = UIAlertController(title: titleString,
                                                message: alert,
                                                preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction.init(title: "OK", style: .default, handler: handler))
        delegate.present(alertController, animated: true, completion: nil)
        return alertController
    }
}
