//
//  SearchVCCollectionMethods.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: recomendedCollectionCellReuseID, for: indexPath) as! RecomendedCollectionCell
        cell.servicePhotoImageView.image = #imageLiteral(resourceName: "apple")
        cell.serviceDistanceLabel.text = "12444.17 km"
        cell.serviceNameLabel.text = "Apple Service"
        cell.serviceTypeLabel.text = "Electronic"
        return cell
    }
    
}
