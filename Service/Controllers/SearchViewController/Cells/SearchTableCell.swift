//
//  SearchTableCell.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class SearchTableCell: UITableViewCell {
    
    let servicePhotoImageView = UIImageView()
    let serviceNameLabel      = UILabel()
    let serviceTypeLabel      = UILabel()
    let serviceAddressLabel   = UILabel()
    let serviceDistanceLabel  = UILabel()
    let serviceRatingLabel    = UILabel()
    let serviceRaitingView    = CosmosView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.addShadow(opacity: 0.2, radius: 2.5)
        self.contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true
        
        servicePhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        servicePhotoImageView.contentMode = .scaleAspectFill
        servicePhotoImageView.layer.cornerRadius = 10
        servicePhotoImageView.layer.masksToBounds = true
        containerView.addSubview(servicePhotoImageView)
        servicePhotoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        servicePhotoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10).isActive = true
        servicePhotoImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        servicePhotoImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        
        serviceRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceRatingLabel.textColor = AppColors.servicePurpleishBlue
        serviceRatingLabel.font = AppConstants.heitiMediumFontWith(scale: 32)
        serviceRatingLabel.textAlignment = .right
        containerView.addSubview(serviceRatingLabel)
        serviceRatingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10).isActive = true
        serviceRatingLabel.centerYAnchor.constraint(equalTo: servicePhotoImageView.centerYAnchor).isActive = true
        
        serviceRaitingView.translatesAutoresizingMaskIntoConstraints = false
        serviceRaitingView.settings.fillMode = .precise
        serviceRaitingView.settings.filledColor = AppColors.serviceOrangePink
        serviceRaitingView.settings.emptyColor = AppColors.serviceLightGrey
        serviceRaitingView.settings.filledBorderWidth = 0
        serviceRaitingView.settings.emptyBorderWidth = 0
        serviceRaitingView.settings.starSize = 10
        serviceRaitingView.settings.starMargin = 1
        serviceRaitingView.settings.totalStars = 5
        containerView.addSubview(serviceRaitingView)
        serviceRaitingView.topAnchor.constraint(equalTo: serviceRatingLabel.bottomAnchor).isActive = true
        serviceRaitingView.trailingAnchor.constraint(equalTo: serviceRatingLabel.trailingAnchor).isActive = true
        serviceRaitingView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        serviceRaitingView.widthAnchor.constraint(equalToConstant: 55).isActive = true
        
        serviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        serviceNameLabel.textColor = AppColors.serviceSteel
        serviceNameLabel.numberOfLines = 2
        containerView.addSubview(serviceNameLabel)
        serviceNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10).isActive = true
        serviceNameLabel.leadingAnchor.constraint(equalTo: servicePhotoImageView.trailingAnchor, constant: 10).isActive = true
        serviceNameLabel.trailingAnchor.constraint(equalTo: serviceRaitingView.leadingAnchor, constant: -15).isActive = true
        
        serviceTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceTypeLabel.font = UIFont.systemFont(ofSize: 9)
        serviceTypeLabel.textColor = AppColors.servicePurpleishBlue
        containerView.addSubview(serviceTypeLabel)
        serviceTypeLabel.leadingAnchor.constraint(equalTo: serviceNameLabel.leadingAnchor).isActive = true
        serviceTypeLabel.topAnchor.constraint(equalTo: serviceNameLabel.bottomAnchor).isActive = true
        serviceTypeLabel.trailingAnchor.constraint(equalTo: serviceRaitingView.leadingAnchor, constant: -15).isActive = true
        
        serviceAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceAddressLabel.font = UIFont.systemFont(ofSize: 9)
        serviceAddressLabel.textColor = AppColors.serviceSteel
        serviceAddressLabel.numberOfLines = 2
        containerView.addSubview(serviceAddressLabel)
        serviceAddressLabel.leadingAnchor.constraint(equalTo: serviceNameLabel.leadingAnchor).isActive = true
        serviceAddressLabel.topAnchor.constraint(equalTo: serviceTypeLabel.bottomAnchor).isActive = true
        serviceAddressLabel.trailingAnchor.constraint(equalTo: serviceRaitingView.leadingAnchor, constant: -15).isActive = true
        
        serviceDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceDistanceLabel.font = UIFont.systemFont(ofSize: 9)
        serviceDistanceLabel.textColor = AppColors.serviceSteel
        containerView.addSubview(serviceDistanceLabel)
        serviceDistanceLabel.leadingAnchor.constraint(equalTo: serviceNameLabel.leadingAnchor).isActive = true
        serviceDistanceLabel.topAnchor.constraint(equalTo: serviceAddressLabel.bottomAnchor).isActive = true
        serviceDistanceLabel.trailingAnchor.constraint(equalTo: serviceRaitingView.leadingAnchor, constant: -15).isActive = true
        serviceDistanceLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
