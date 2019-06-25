//
//  RecomendedCollectionCell.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class RecomendedCollectionCell: UICollectionViewCell {
    
    let servicePhotoImageView = UIImageView()
    let serviceNameLabel      = UILabel()
    let serviceTypeLabel      = UILabel()
    let serviceDistanceLabel  = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.backgroundColor = .clear
        self.contentView.layer.cornerRadius = 10
        self.contentView.addShadow(opacity: 0.4, radius: 2, withCornerRadius: 10)
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        self.contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
        servicePhotoImageView.translatesAutoresizingMaskIntoConstraints = false
        servicePhotoImageView.contentMode = .scaleAspectFill
        servicePhotoImageView.layer.masksToBounds = true
        containerView.addSubview(servicePhotoImageView)
        servicePhotoImageView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        servicePhotoImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        servicePhotoImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        servicePhotoImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        serviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceNameLabel.font = AppConstants.heitiMediumFontWith(scale: 12)
        serviceNameLabel.textColor = AppColors.serviceSteel
        containerView.addSubview(serviceNameLabel)
        serviceNameLabel.topAnchor.constraint(equalTo: servicePhotoImageView.bottomAnchor).isActive = true
        serviceNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4).isActive = true
        serviceNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4).isActive = true
        serviceNameLabel.heightAnchor.constraint(equalToConstant: 16).isActive = true
        
        serviceTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceTypeLabel.font = UIFont.systemFont(ofSize: 9)
        serviceTypeLabel.textColor = AppColors.servicePurpleishBlue
        containerView.addSubview(serviceTypeLabel)
        serviceTypeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4).isActive = true
        serviceTypeLabel.topAnchor.constraint(equalTo: serviceNameLabel.bottomAnchor).isActive = true
        serviceTypeLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -4).isActive = true
        serviceTypeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -4).isActive = true
        
        serviceDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceDistanceLabel.backgroundColor = AppColors.serviceLightGrey
        serviceDistanceLabel.font = UIFont.systemFont(ofSize: 6)
        serviceDistanceLabel.textAlignment = .center
        serviceDistanceLabel.layer.cornerRadius = 2
        serviceDistanceLabel.layer.masksToBounds = true
        containerView.addSubview(serviceDistanceLabel)
        serviceDistanceLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 4).isActive = true
        serviceDistanceLabel.bottomAnchor.constraint(equalTo: servicePhotoImageView.bottomAnchor, constant: -4).isActive = true
        serviceDistanceLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 31).isActive = true
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
