//
//  LoginVCTextFieldMethods.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//


import Foundation
import UIKit

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return true}
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        switch textField {
        case emailTextField:
            if newText.isEmpty {
                emailTextField.isValid = true
            } else {
                emailTextField.isValid = newText.emailValidation()
            }
            return true
        default:
            break
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            passwordField.becomeFirstResponder()
        case passwordField:
            loginButtonAction()
        default:
            break
        }
        return true
    }
    
}
