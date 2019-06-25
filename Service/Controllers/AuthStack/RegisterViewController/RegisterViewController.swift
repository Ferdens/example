//
//  RegisterViewController.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class RegisterViewController: UIViewController {
    
    var scrollViewBottomConstraint = NSLayoutConstraint()
    
    let firstNameTextField  = BottomBorderTextField()
    let lastNameTextField   = BottomBorderTextField()
    let emailTextField      = BottomBorderTextField()
    let passwordField       = BottomBorderTextField()
    let repeatPasswordField = BottomBorderTextField()

    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeNotifications()
    }
    
    // MARK: - User actions
    
    @objc func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func signUpButtonAction() {
        guard let email = emailTextField.text, let firstName = firstNameTextField.text, let lastName = lastNameTextField.text, let password = passwordField.text, let rePassword = repeatPasswordField.text else {return}
        guard !firstName.isEmpty else { SimpleAlert.showAlert(alert: "First name can't be blank.", delegate: self); return}
        guard !lastName.isEmpty else { SimpleAlert.showAlert(alert: "Last name can't be blank.", delegate: self); return}
        guard !email.isEmpty else { SimpleAlert.showAlert(alert: "Email name can't be blank.", delegate: self); return}
        guard !password.isEmpty else { SimpleAlert.showAlert(alert: "Password name can't be blank.", delegate: self); return}

        guard email.emailValidation() else {SimpleAlert.showAlert(alert: "Email is not valid.", delegate: self); return}
        guard password.count >= 6 else {SimpleAlert.showAlert(alert: "Password is too short.", delegate: self);return}
        guard password == rePassword else {SimpleAlert.showAlert(alert: "Password and repeat password fields must be the same.", delegate: self); return}
        
        let sessionData = NSMutableDictionary()
        sessionData.setValue(email, forKey: "email")
        sessionData.setValue(firstName, forKey: "firstName")
        sessionData.setValue(lastName, forKey: "lastName")
        sessionData.setValue(password, forKey: "password")
        sessionData.setValue(rePassword, forKey: "rePassword")

        SVProgressHUD.show()
        User.registerWith(data: sessionData) { (user, error) in
            SVProgressHUD.dismiss()
            if let error = error {
                SimpleAlert.showAlert(alert: error, delegate: self)
            }
            if user != nil {
                self.navigationController?.pushViewController(WelcomeViewController(), animated: true)
            }
        }
    }
    
    // MARK: - Register notifications
    
    func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - RemoveNotifications
    
    func removeNotifications () {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - KeyboardActions
    
    @objc func kbWillShow (_ notification: NSNotification) {
        let userInfo = notification.userInfo
        let keyBoardFrame = (userInfo?[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollViewBottomConstraint.constant = -keyBoardFrame.height
    }
    
    @objc func kbWillHide () {
        scrollViewBottomConstraint.constant = 0
    }
    
}
