//
//  DetailPhotoCollectionViewCell.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class DetailPhotoCollectionViewCell: UICollectionViewCell {
    
    let cellImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.contentMode = .scaleAspectFill
        cellImageView.layer.masksToBounds = true
        self.contentView.addSubview(cellImageView)
        cellImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        cellImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        cellImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        cellImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellImageView.image = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
