
//
//  RegisterVCUserInterface.swift
//  Service
//
//  Created by anton Shepetuha on 03.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension RegisterViewController {
    
    func setupUI() {
        
        hideKeyboardOnTap()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: .clear), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.view.backgroundColor = .white
        
        let backButton = UIButton()
        backButton.setImage(#imageLiteral(resourceName: "arrow_icon"), for: .normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        let backBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButton
        
        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = #imageLiteral(resourceName: "loginCircles")
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
        
        let topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.textColor = AppColors.serviceDarkBlueGrey
        topLabel.text = "Sign up"
        topLabel.font = AppConstants.heitiMediumFontWith(scale: 26)
        container.addSubview(topLabel)
        topLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 96).isActive = true
        topLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        topLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        let attributedLabelText = NSMutableAttributedString()
        attributedLabelText.append(AppConstants.attributedStringWith(font: AppConstants.heitiMediumFontWith(scale: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "Create an account to use "))
        attributedLabelText.append(AppConstants.attributedStringWith(font: AppConstants.heitiMediumFontWith(scale: 16) ?? UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.servicePurpleishBlue, text: "Srevice."))
        
        let createAccountLabel = UILabel()
        createAccountLabel.translatesAutoresizingMaskIntoConstraints = false
        createAccountLabel.attributedText = attributedLabelText
        container.addSubview(createAccountLabel)
        createAccountLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 17).isActive = true
        createAccountLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor).isActive = true
        
        firstNameTextField.translatesAutoresizingMaskIntoConstraints = false
        firstNameTextField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "First Name")
        firstNameTextField.textColor = .black
        firstNameTextField.autocapitalizationType = .words
        firstNameTextField.autocorrectionType = .no
        firstNameTextField.returnKeyType = .next
        firstNameTextField.delegate = self
        container.addSubview(firstNameTextField)
        firstNameTextField.topAnchor.constraint(equalTo: createAccountLabel.bottomAnchor, constant: 28).isActive = true
        firstNameTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        firstNameTextField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        firstNameTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        lastNameTextField.translatesAutoresizingMaskIntoConstraints = false
        lastNameTextField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "Last Name")
        lastNameTextField.textColor = .black
        lastNameTextField.autocapitalizationType = .words
        lastNameTextField.autocorrectionType = .no
        lastNameTextField.returnKeyType = .next
        lastNameTextField.delegate = self
        container.addSubview(lastNameTextField)
        lastNameTextField.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: 40).isActive = true
        lastNameTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        lastNameTextField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        lastNameTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "Email address")
        emailTextField.textColor = .black
        emailTextField.keyboardType = .emailAddress
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        emailTextField.returnKeyType = .next
        emailTextField.delegate = self
        container.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 40).isActive = true
        emailTextField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "Password")
        passwordField.textColor = .black
        passwordField.isSecureTextEntry = true
        passwordField.warningText = "Password must contains 6 or more symbols."
        passwordField.returnKeyType = .next
        passwordField.delegate = self
        container.addSubview(passwordField)
        passwordField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40).isActive = true
        passwordField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        repeatPasswordField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "Repeat Password")
        repeatPasswordField.textColor = .black
        repeatPasswordField.isSecureTextEntry = true
        repeatPasswordField.warningText = "Repeat password is not the same as password."
        repeatPasswordField.returnKeyType = .go
        repeatPasswordField.delegate = self
        container.addSubview(repeatPasswordField)
        repeatPasswordField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 40).isActive = true
        repeatPasswordField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        repeatPasswordField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        repeatPasswordField.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -32).isActive = true
        
        let signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.backgroundColor = AppColors.serviceOrangePink.withAlphaComponent(0.2)
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        signUpButton.setTitleColor(AppColors.serviceOrangePink, for: .normal)
        signUpButton.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = 23
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        container.addSubview(signUpButton)
        signUpButton.topAnchor.constraint(equalTo: repeatPasswordField.bottomAnchor, constant: 40).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 32).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 43).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 93).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -25).isActive = true
        
        let attributedString = NSMutableAttributedString()
        attributedString.append(AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.serviceSteel, text: "I already have an account. "))
        
        attributedString.append(AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 16, weight: .medium), color: AppColors.servicePurpleishBlue, text: "Login"))
        
        let alreadyHaveAccountButton = UIButton()
        alreadyHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
        alreadyHaveAccountButton.setAttributedTitle(attributedString, for: .normal)
        alreadyHaveAccountButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        self.view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        alreadyHaveAccountButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -37).isActive = true
        
        let bottomView = UIView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.backgroundColor = AppColors.servicePurpleishBlue.withAlphaComponent(0.15)
        self.view.addSubview(bottomView)
        bottomView.topAnchor.constraint(equalTo: alreadyHaveAccountButton.bottomAnchor, constant: -1).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: alreadyHaveAccountButton.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        bottomView.widthAnchor.constraint(equalToConstant: "Login".width(withConstraintedHeight: 20, font: UIFont.systemFont(ofSize: 16, weight: .medium))).isActive = true

    }
    
}
