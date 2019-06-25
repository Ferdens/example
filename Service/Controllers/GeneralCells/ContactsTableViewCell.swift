//
//  ContactsTableViewCell.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    let contactLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        contactLabel.translatesAutoresizingMaskIntoConstraints = false
        contactLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        contactLabel.textColor = AppColors.serviceSteel
        contactLabel.numberOfLines = 2
        self.contentView.addSubview(contactLabel)
        contactLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 6).isActive = true
        contactLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 6).isActive = true
        contactLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -6).isActive = true
        contactLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
}
