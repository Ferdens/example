//
//  DetailTableViewCell.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    let titleLabel      = UILabel()
    let dataLabel       = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.textColor = AppColors.serviceSteel
        self.contentView.addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 6).isActive = true
        titleLabel.setContentHuggingPriority(UILayoutPriority.defaultLow + 2, for: .horizontal)
        let titleLabelWidhtConstraint = titleLabel.widthAnchor.constraint(lessThanOrEqualTo: self.contentView.widthAnchor, multiplier: 0.4)
        titleLabelWidhtConstraint.isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 6).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        dataLabel.font = UIFont.systemFont(ofSize: 16)
        dataLabel.textColor = AppColors.serviceSteel
        self.contentView.addSubview(dataLabel)
        dataLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6).isActive = true
        dataLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 6).isActive = true
        dataLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        let dataLabelWidthConstraint = dataLabel.widthAnchor.constraint(lessThanOrEqualTo: self.contentView.widthAnchor, multiplier: 0.5)
        dataLabelWidthConstraint.isActive = true
        
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = AppColors.serviceSteel
        separatorView.setContentHuggingPriority(UILayoutPriority.defaultLow, for: .horizontal)
        if let prioroty = UILayoutConstraintAxis(rawValue: 749) {
            separatorView.contentCompressionResistancePriority(for: prioroty)
        }
        self.contentView.addSubview(separatorView)
        separatorView.centerYAnchor.constraint(equalTo: dataLabel.centerYAnchor).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: dataLabel.leadingAnchor, constant: -4).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        self.contentView.sendSubview(toBack: separatorView)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dataLabel.text = ""
        titleLabel.text = ""
        dataLabel.textColor = AppColors.serviceSteel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
