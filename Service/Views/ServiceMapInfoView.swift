//
//  ServiceMapInfoView.swift
//  Service
//
//  Created by anton Shepetuha on 28.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class ServiceMapInfoView: UIView {
    
    let hideInfoViewButton      = UIButton()
    
    let servicePhotoImageView = UIImageView()
    let serviceNameLabel      = UILabel()
    let serviceTypeLabel      = UILabel()
    let serviceAddressLabel   = UILabel()
    let serviceDistanceLabel  = UILabel()
    let serviceRatingLabel    = UILabel()
    let serviceRaitingView    = CosmosView()
    let rececommendedLabel    = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        hideInfoViewButton.translatesAutoresizingMaskIntoConstraints = false
        hideInfoViewButton.setImage(#imageLiteral(resourceName: "arrowDown_icon"), for: .normal)
        self.addSubview(hideInfoViewButton)
        hideInfoViewButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 2).isActive = true
        hideInfoViewButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        hideInfoViewButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        hideInfoViewButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        
        servicePhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        servicePhotoImageView.contentMode = .scaleAspectFill
        servicePhotoImageView.layer.cornerRadius = 10
        servicePhotoImageView.layer.masksToBounds = true
        self.addSubview(servicePhotoImageView)
        servicePhotoImageView.topAnchor.constraint(equalTo: hideInfoViewButton.bottomAnchor, constant: 10).isActive = true
        servicePhotoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 6).isActive = true
        servicePhotoImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        servicePhotoImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        serviceRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceRatingLabel.textColor = AppColors.servicePurpleishBlue
        serviceRatingLabel.font = AppConstants.heitiMediumFontWith(scale: 39)
        serviceRatingLabel.textAlignment = .right
        self.addSubview(serviceRatingLabel)
        serviceRatingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -6).isActive = true
        serviceRatingLabel.topAnchor.constraint(equalTo: servicePhotoImageView.topAnchor).isActive = true
        
        serviceRaitingView.translatesAutoresizingMaskIntoConstraints = false
        serviceRaitingView.settings.fillMode = .precise
        serviceRaitingView.settings.filledColor = AppColors.serviceOrangePink
        serviceRaitingView.settings.emptyColor = AppColors.serviceLightGrey
        serviceRaitingView.settings.filledBorderWidth = 0
        serviceRaitingView.settings.emptyBorderWidth = 0
        serviceRaitingView.settings.starSize = 12
        serviceRaitingView.settings.starMargin = 1
        serviceRaitingView.settings.totalStars = 5
        self.addSubview(serviceRaitingView)
        serviceRaitingView.topAnchor.constraint(equalTo: serviceRatingLabel.bottomAnchor).isActive = true
        serviceRaitingView.trailingAnchor.constraint(equalTo: serviceRatingLabel.trailingAnchor).isActive = true
        serviceRaitingView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        serviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        serviceNameLabel.textColor = AppColors.serviceSteel
        serviceNameLabel.numberOfLines = 2
        self.addSubview(serviceNameLabel)
        serviceNameLabel.topAnchor.constraint(equalTo: servicePhotoImageView.topAnchor).isActive = true
        serviceNameLabel.leadingAnchor.constraint(equalTo: servicePhotoImageView.trailingAnchor, constant: 10).isActive = true
        serviceNameLabel.trailingAnchor.constraint(equalTo: serviceRaitingView.leadingAnchor, constant: -15).isActive = true
        
        serviceTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceTypeLabel.font = UIFont.systemFont(ofSize: 12)
        serviceTypeLabel.textColor = AppColors.servicePurpleishBlue
        self.addSubview(serviceTypeLabel)
        serviceTypeLabel.leadingAnchor.constraint(equalTo: serviceNameLabel.leadingAnchor).isActive = true
        serviceTypeLabel.topAnchor.constraint(equalTo: serviceNameLabel.bottomAnchor).isActive = true
        serviceTypeLabel.trailingAnchor.constraint(equalTo: serviceRaitingView.leadingAnchor, constant: -15).isActive = true
        
        serviceAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceAddressLabel.font = UIFont.systemFont(ofSize: 12)
        serviceAddressLabel.textColor = AppColors.serviceSteel
        serviceAddressLabel.numberOfLines = 2
        self.addSubview(serviceAddressLabel)
        serviceAddressLabel.leadingAnchor.constraint(equalTo: serviceNameLabel.leadingAnchor).isActive = true
        serviceAddressLabel.topAnchor.constraint(equalTo: serviceTypeLabel.bottomAnchor).isActive = true
        serviceAddressLabel.trailingAnchor.constraint(equalTo: serviceRaitingView.leadingAnchor, constant: -15).isActive = true
        
        serviceDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceDistanceLabel.font = UIFont.systemFont(ofSize: 12)
        serviceDistanceLabel.textColor = AppColors.serviceSteel
        self.addSubview(serviceDistanceLabel)
        serviceDistanceLabel.leadingAnchor.constraint(equalTo: serviceNameLabel.leadingAnchor).isActive = true
        serviceDistanceLabel.topAnchor.constraint(equalTo: serviceAddressLabel.bottomAnchor).isActive = true
        serviceDistanceLabel.trailingAnchor.constraint(equalTo: serviceRaitingView.leadingAnchor, constant: -15).isActive = true
        serviceDistanceLabel.bottomAnchor.constraint(equalTo: servicePhotoImageView.bottomAnchor).isActive = true
        
        rececommendedLabel.translatesAutoresizingMaskIntoConstraints = false
        rececommendedLabel.textColor = AppColors.serviceOrangePink
        rececommendedLabel.font = UIFont.systemFont(ofSize: 12)
        rececommendedLabel.text = "Recomended"
        rececommendedLabel.isHidden = true
        self.addSubview(rececommendedLabel)
        rececommendedLabel.leadingAnchor.constraint(equalTo: servicePhotoImageView.leadingAnchor).isActive = true
        rececommendedLabel.bottomAnchor.constraint(equalTo: servicePhotoImageView.topAnchor, constant: -4).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
