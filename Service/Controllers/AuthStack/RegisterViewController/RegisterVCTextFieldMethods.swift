//
//  RegisterVCTextFieldMethods.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension RegisterViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return true}
        let newText = (text as NSString).replacingCharacters(in: range, with: string)
        switch textField {
        case firstNameTextField, lastNameTextField:
            return newText.count <= 25
        case emailTextField:
            if newText.isEmpty {
                emailTextField.isValid = true
            } else {
                emailTextField.isValid = newText.emailValidation()
            }
            return newText.count <= 30
        case passwordField:
            if newText.isEmpty {
                passwordField.isValid = true
            } else {
                passwordField.isValid = newText.count >= 6
            }
            return newText.count <= 20
        case repeatPasswordField:
            if newText.isEmpty {
                repeatPasswordField.isValid = true
            } else {
                if let passwordText = passwordField.text {
                    repeatPasswordField.isValid = (newText == passwordText)
                }
            }
        default:
            break
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstNameTextField:
            lastNameTextField.becomeFirstResponder()
        case lastNameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            passwordField.becomeFirstResponder()
        case passwordField:
            repeatPasswordField.becomeFirstResponder()
        case repeatPasswordField:
            signUpButtonAction()
        default:
            break
        }
        return true
    }
    
}
