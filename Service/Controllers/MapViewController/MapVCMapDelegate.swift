
//
//  MapVCMapDelegate.swift
//  Service
//
//  Created by anton Shepetuha on 28.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

extension MapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let service = self.services[marker.userData as! Int]
        if serviceInfoViewBottomConstraint.constant == infoViewHeight {
            serviceInfoView.rececommendedLabel.isHidden = !service.isRecomended
            serviceInfoViewBottomConstraint.constant = 0
        } else {
            serviceInfoViewBottomConstraint.constant = infoViewHeight
        }
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: [], animations: {
            self.view.layoutIfNeeded()
        }, completion: { (_) in
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: [], animations: {
                if self.serviceInfoViewBottomConstraint.constant == self.infoViewHeight {
                    self.serviceInfoViewBottomConstraint.constant = 0
                    self.serviceInfoView.rececommendedLabel.isHidden = !service.isRecomended
                }
                self.view.layoutIfNeeded()
            }, completion: nil)
        })

        let markerCameraPosition = GMSCameraPosition.camera(withTarget: marker.position, zoom: 18.0)
        CATransaction.begin()
        CATransaction.setValue(1, forKey: kCATransactionAnimationDuration)
        self.mapView.animate(to: markerCameraPosition)
        CATransaction.commit()
        return true
    }
    
    
}
