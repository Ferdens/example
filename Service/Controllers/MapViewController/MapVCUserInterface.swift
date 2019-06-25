//
//  MapVCUserInterface.swift
//  Service
//
//  Created by anton Shepetuha on 28.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension MapViewController: UITextFieldDelegate {
    
    func setupUI() {
        
        hideKeyboardOnTap()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        self.view.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.backgroundColor = .white
        searchContainer.layer.cornerRadius = 10
        searchContainer.addShadow(opacity: 0.3, radius: 3)
        self.view.addSubview(searchContainer)
        searchContainer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: AppConstants.statusBarHeight + 4).isActive = true
        searchContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 6).isActive = true
        searchContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -6).isActive = true
        searchContainer.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let leftSeaparatorView = UIView()
        leftSeaparatorView.translatesAutoresizingMaskIntoConstraints = false
        leftSeaparatorView.backgroundColor = AppColors.serviceTabBarGrey
        searchContainer.addSubview(leftSeaparatorView)
        leftSeaparatorView.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 44).isActive = true
        leftSeaparatorView.topAnchor.constraint(equalTo: searchContainer.topAnchor).isActive = true
        leftSeaparatorView.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor).isActive = true
        leftSeaparatorView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.layer.cornerRadius = 10
        backButton.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        backButton.layer.masksToBounds = true
        backButton.setImage(#imageLiteral(resourceName: "arrow_icon").withRenderingMode(.alwaysTemplate), for: .normal)
        backButton.tintColor = AppColors.serviceOrangePink
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        searchContainer.addSubview(backButton)
        backButton.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor).isActive = true
        backButton.topAnchor.constraint(equalTo: searchContainer.topAnchor).isActive = true
        backButton.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor).isActive = true
        backButton.trailingAnchor.constraint(equalTo: leftSeaparatorView.leadingAnchor).isActive = true
        
        let rightSeaparatorView = UIView()
        rightSeaparatorView.translatesAutoresizingMaskIntoConstraints = false
        rightSeaparatorView.backgroundColor = AppColors.serviceTabBarGrey
        searchContainer.addSubview(rightSeaparatorView)
        rightSeaparatorView.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -44).isActive = true
        rightSeaparatorView.topAnchor.constraint(equalTo: searchContainer.topAnchor).isActive = true
        rightSeaparatorView.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor).isActive = true
        rightSeaparatorView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        
        let filterButton = UIButton()
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.layer.cornerRadius = 10
        filterButton.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        filterButton.layer.masksToBounds = true
        filterButton.setImage(#imageLiteral(resourceName: "filter_icon").withRenderingMode(.alwaysTemplate), for: .normal)
        filterButton.tintColor = AppColors.serviceOrangePink
        searchContainer.addSubview(filterButton)
        filterButton.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor).isActive = true
        filterButton.topAnchor.constraint(equalTo: searchContainer.topAnchor).isActive = true
        filterButton.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor).isActive = true
        filterButton.leadingAnchor.constraint(equalTo: rightSeaparatorView.trailingAnchor).isActive = true
        
        let searchCaregoryTextField = UITextField()
        searchCaregoryTextField.translatesAutoresizingMaskIntoConstraints = false
        searchCaregoryTextField.delegate = self
        searchCaregoryTextField.returnKeyType = .search
        searchCaregoryTextField.backgroundColor = .clear
        searchCaregoryTextField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 15), color: UIColor(white: 142.0 / 255.0, alpha: 1), text: "Search service category you need.")
        searchCaregoryTextField.font = UIFont.systemFont(ofSize: 15)
        searchCaregoryTextField.leftViewMode = .always
        searchContainer.addSubview(searchCaregoryTextField)
        searchCaregoryTextField.leadingAnchor.constraint(equalTo: leftSeaparatorView.trailingAnchor).isActive = true
        searchCaregoryTextField.topAnchor.constraint(equalTo: searchContainer.topAnchor).isActive = true
        searchCaregoryTextField.bottomAnchor.constraint(equalTo: searchContainer.bottomAnchor).isActive = true
        searchCaregoryTextField.trailingAnchor.constraint(equalTo: rightSeaparatorView.leadingAnchor).isActive = true
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 27, height: 40))
        let searchImageView = UIImageView()
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.image = #imageLiteral(resourceName: "searchTabBar").withRenderingMode(.alwaysTemplate)
        searchImageView.tintColor = .black
        searchImageView.contentMode = .scaleAspectFit
        leftView.addSubview(searchImageView)
        searchImageView.centerXAnchor.constraint(equalTo: leftView.centerXAnchor).isActive = true
        searchImageView.centerYAnchor.constraint(equalTo: leftView.centerYAnchor).isActive = true
        searchImageView.heightAnchor.constraint(equalToConstant: 15)
        searchImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        searchCaregoryTextField.leftView = leftView
        
        serviceInfoView.translatesAutoresizingMaskIntoConstraints = false
        serviceInfoView.hideInfoViewButton.addTarget(self, action: #selector(hideInfoView), for: .touchUpInside)
        serviceInfoView.servicePhotoImageView.image = #imageLiteral(resourceName: "apple")
        serviceInfoView.serviceNameLabel.text = "Apple Service"
        serviceInfoView.serviceRaitingView.rating = 5.0
        serviceInfoView.serviceRatingLabel.text = "5.0"
        serviceInfoView.serviceTypeLabel.text = "Electronica"
        serviceInfoView.serviceAddressLabel.text = "AddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddress"
        serviceInfoView.serviceDistanceLabel.text = "0.17 km"
        self.view.addSubview(serviceInfoView)
        serviceInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        serviceInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        serviceInfoView.heightAnchor.constraint(equalToConstant: infoViewHeight).isActive = true
        serviceInfoViewBottomConstraint = serviceInfoView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: infoViewHeight)
        serviceInfoViewBottomConstraint.isActive = true
        
        let currentUserLoactionButton = UIButton()
        currentUserLoactionButton.translatesAutoresizingMaskIntoConstraints = false
        currentUserLoactionButton.backgroundColor = AppColors.servicePurpleishBlue
        currentUserLoactionButton.setImage(#imageLiteral(resourceName: "userLocation_icon"), for: .normal)
        currentUserLoactionButton.layer.cornerRadius = 20
        currentUserLoactionButton.layer.masksToBounds = true
        currentUserLoactionButton.addTarget(self, action: #selector(showCurrentUserLocationAction), for: .touchUpInside)
        self.view.addSubview(currentUserLoactionButton)
        currentUserLoactionButton.bottomAnchor.constraint(equalTo: serviceInfoView.topAnchor, constant: -24).isActive = true
        currentUserLoactionButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -6).isActive = true
        currentUserLoactionButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        currentUserLoactionButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
