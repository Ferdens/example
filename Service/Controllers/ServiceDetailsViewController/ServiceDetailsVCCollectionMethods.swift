//
//  ServiceDetailsVCCollectionMethods.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension ServiceDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case detailsPhotosCollectionView:
            return 3
        case workersCollectionView:
            return 5
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case workersCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: workersCollectionViewCellReuseID, for: indexPath) as! WorkersCollectionViewCell
            cell.photoImageView.image = #imageLiteral(resourceName: "TestUserImage")
            cell.workerNameLabel.text = "Zuzanna Wiler"
            cell.positionName.text = "Position name"
            cell.workerRaitingView.rating = 5.0
            cell.workerRatingLabel.text = "5.0"
            return cell
        case detailsPhotosCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailPhotoCollectionViewCellReuseID, for: indexPath) as! DetailPhotoCollectionViewCell
            cell.cellImageView.image = #imageLiteral(resourceName: "apple")
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
    
}
