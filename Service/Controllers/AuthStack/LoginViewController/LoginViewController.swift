//
//  LoginViewController.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    var scrollViewBottomConstraint = NSLayoutConstraint()
    
    let emailTextField = BottomBorderTextField()
    let passwordField  = BottomBorderTextField()

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
    
    @objc func openRegister() {
        self.navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc func loginButtonAction() {
        guard let email = emailTextField.text, let password = passwordField.text else {return}
        guard !email.isEmpty else { SimpleAlert.showAlert(alert: "Email name can't be blank.", delegate: self); return}
        guard !password.isEmpty else { SimpleAlert.showAlert(alert: "Password name can't be blank.", delegate: self); return}
        guard email.emailValidation() else {SimpleAlert.showAlert(alert: "Email is not valid.", delegate: self); return}
        
        SVProgressHUD.show()
        User.login(email: email, password: password) { (user, error) in
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
