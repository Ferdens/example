
//
//  LoginVCUserInterface.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension LoginViewController {
    
    func setupUI() {
        
        hideKeyboardOnTap()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: .clear), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.view.backgroundColor = .white

        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = #imageLiteral(resourceName: "circlesSignUp")
        self.view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.backgroundColor = .clear
        self.view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        scrollViewBottomConstraint = scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        scrollViewBottomConstraint.isActive = true
        
        let container = UIView()
        scrollView.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.widthAnchor.constraint(equalToConstant: AppConstants.screenSize.width).isActive = true
        container.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        container.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        container.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
        container.rightAnchor.constraint(equalTo: scrollView.rightAnchor).isActive = true
        
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = #imageLiteral(resourceName: "logoTinted")
        logoImageView.contentMode = .scaleAspectFit
        container.addSubview(logoImageView)
        logoImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 84).isActive = true
        logoImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 32).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 43).isActive = true
        
        let logoLabel = UILabel()
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        logoLabel.textColor = AppColors.servicePurpleishBlue
        logoLabel.font = AppConstants.heitiMediumFontWith(scale: 48)
        logoLabel.text = "Service"
        container.addSubview(logoLabel)
        logoLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor).isActive = true
        logoLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 10).isActive = true
        logoLabel.bottomAnchor.constraint(equalTo: logoImageView.bottomAnchor).isActive = true
        logoLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "Email address")
        emailTextField.textColor = .black
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.delegate = self
        container.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 84).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "Password")
        passwordField.textColor = .black
        passwordField.isSecureTextEntry = true
        passwordField.delegate = self
        container.addSubview(passwordField)
        passwordField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.backgroundColor = AppColors.servicePurpleishBlue.withAlphaComponent(0.2)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        loginButton.setTitleColor(AppColors.servicePurpleishBlue, for: .normal)
        loginButton.layer.masksToBounds = true
        loginButton.layer.cornerRadius = 23
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        container.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 42).isActive = true
        loginButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 93).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
        
        let forgotPasswordButton = BottomBorderButton()
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.setTitle("Forgot password?", for: .normal)
        forgotPasswordButton.setTitleColor(AppColors.servicePurpleishBlue, for: .normal)
        forgotPasswordButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        forgotPasswordButton.borderColor = AppColors.servicePurpleishBlue.withAlphaComponent(0.15)
        container.addSubview(forgotPasswordButton)
        forgotPasswordButton.centerYAnchor.constraint(equalTo: loginButton.centerYAnchor).isActive = true
        forgotPasswordButton.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "Still without account?"))
        
        attributedString.append(AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceOrangePink, text: " Create One"))
        
        let stillWithoutAccountButton = UIButton()
        stillWithoutAccountButton.translatesAutoresizingMaskIntoConstraints = false
        stillWithoutAccountButton.setAttributedTitle(attributedString, for: .normal)
        stillWithoutAccountButton.addTarget(self, action: #selector(openRegister), for: .touchUpInside)
        self.view.addSubview(stillWithoutAccountButton)
        stillWithoutAccountButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        stillWithoutAccountButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -37).isActive = true
        
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = AppColors.serviceOrangePink.withAlphaComponent(0.15)
        self.view.addSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: stillWithoutAccountButton.bottomAnchor, constant: -1).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: stillWithoutAccountButton.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: "Create One".width(withConstraintedHeight: 20, font: UIFont.systemFont(ofSize: 16, weight: .medium))).isActive = true
        
    }
    
}
