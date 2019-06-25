//
//  ServiceTableViewCell.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class ServiceTableViewCell: UITableViewCell {
    
    let serviceNameLabel     = UILabel()
    let serviceCategoryLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .white
        containerView.addShadow(opacity: 0.2, radius: 2)
        containerView.layer.cornerRadius = 10
        self.contentView.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 6).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 6).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -6).isActive = true
        
        let bookButton = UIButton()
        bookButton.translatesAutoresizingMaskIntoConstraints = false
        bookButton.backgroundColor = AppColors.serviceOrangePink.withAlphaComponent(0.2)
        bookButton.setTitle("Book", for: .normal)
        bookButton.setTitleColor(AppColors.serviceOrangePink, for: .normal)
        bookButton.layer.cornerRadius = 23/2
        bookButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        containerView.addSubview(bookButton)
        bookButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        bookButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -6).isActive = true
        bookButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
        bookButton.widthAnchor.constraint(equalToConstant: 77).isActive = true
        
        serviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceNameLabel.textColor = AppColors.serviceSteel
        serviceNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        serviceNameLabel.numberOfLines = 0
        serviceNameLabel.lineBreakMode = .byCharWrapping
        containerView.addSubview(serviceNameLabel)
        serviceNameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6).isActive = true
        serviceNameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6).isActive = true
        serviceNameLabel.trailingAnchor.constraint(equalTo: bookButton.leadingAnchor, constant: -6).isActive = true
        
        serviceCategoryLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceCategoryLabel.textColor = AppColors.servicePurpleishBlue
        serviceCategoryLabel.font = UIFont.systemFont(ofSize: 12)
        containerView.addSubview(serviceCategoryLabel)
        serviceCategoryLabel.topAnchor.constraint(equalTo: serviceNameLabel.bottomAnchor).isActive = true
        serviceCategoryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 6).isActive = true
        serviceCategoryLabel.trailingAnchor.constraint(equalTo: bookButton.leadingAnchor, constant: -6).isActive = true
        serviceCategoryLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -6).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
}
