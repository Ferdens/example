//
//  WorkersCollectionViewCell.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import Cosmos

class WorkersCollectionViewCell: UICollectionViewCell {

    let photoImageView      = UIImageView()
    let workerNameLabel     = UILabel()
    let positionName        = UILabel()
    let workerRatingLabel   = UILabel()
    let workerRaitingView   = CosmosView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addShadow(opacity: 0.2, radius: 3)
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = .white
        self.contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 6).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 30).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -30).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        
        let photoContainerView = UIView()
        photoContainerView.translatesAutoresizingMaskIntoConstraints = false
        photoContainerView.addShadow(opacity: 0.2, radius: 2)
        photoContainerView.layer.cornerRadius = (frame.height - 24) / 2
        self.contentView.addSubview(photoContainerView)
        photoContainerView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6).isActive = true
        photoContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6).isActive = true
        photoContainerView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6).isActive = true
        photoContainerView.widthAnchor.constraint(equalToConstant: frame.height - 24).isActive = true
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.layer.cornerRadius = (frame.height - 24) / 2
        photoContainerView.addSubview(photoImageView)
        photoImageView.centerXAnchor.constraint(equalTo: photoContainerView.centerXAnchor).isActive = true
        photoImageView.centerYAnchor.constraint(equalTo: photoContainerView.centerYAnchor).isActive = true
        photoImageView.heightAnchor.constraint(equalTo: photoContainerView.heightAnchor, multiplier: 1).isActive = true
        photoImageView.widthAnchor.constraint(equalTo: photoContainerView.widthAnchor, multiplier: 1).isActive = true

        workerNameLabel.translatesAutoresizingMaskIntoConstraints = false
        workerNameLabel.textColor = AppColors.serviceSteel
        workerNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        self.contentView.addSubview(workerNameLabel)
        workerNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6).isActive = true
        workerNameLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 6).isActive = true
        workerNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6).isActive = true
        
        positionName.translatesAutoresizingMaskIntoConstraints = false
        positionName.textColor = AppColors.servicePurpleishBlue
        positionName.font = UIFont.systemFont(ofSize: 12)
        self.contentView.addSubview(positionName)
        positionName.leadingAnchor.constraint(equalTo: workerNameLabel.leadingAnchor).isActive = true
        positionName.trailingAnchor.constraint(equalTo: workerNameLabel.trailingAnchor).isActive = true
        positionName.topAnchor.constraint(equalTo: workerNameLabel.bottomAnchor).isActive = true
        
        workerRatingLabel.translatesAutoresizingMaskIntoConstraints = false
        workerRatingLabel.textColor = AppColors.servicePurpleishBlue
        workerRatingLabel.textAlignment = .center
        workerRatingLabel.font = UIFont.systemFont(ofSize: 45, weight: .medium)
        self.contentView.addSubview(workerRatingLabel)
        workerRatingLabel.topAnchor.constraint(equalTo: positionName.bottomAnchor, constant: 0).isActive = true
        workerRatingLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 6).isActive = true
        workerRatingLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6).isActive = true
        
        workerRaitingView.translatesAutoresizingMaskIntoConstraints = false
        workerRaitingView.settings.fillMode = .precise
        workerRaitingView.settings.filledColor = AppColors.serviceOrangePink
        workerRaitingView.settings.emptyColor = AppColors.serviceLightGrey
        workerRaitingView.settings.filledBorderWidth = 0
        workerRaitingView.settings.emptyBorderWidth = 0
        workerRaitingView.settings.starSize = 15
        workerRaitingView.settings.starMargin = 1
        workerRaitingView.settings.totalStars = 5
        workerRaitingView.isUserInteractionEnabled = false
        self.contentView.addSubview(workerRaitingView)
        workerRaitingView.centerXAnchor.constraint(equalTo: workerRatingLabel.centerXAnchor).isActive = true
        workerRaitingView.topAnchor.constraint(equalTo: workerRatingLabel.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
