//
//  MapViewController.swift
//  Service
//
//  Created by anton Shepetuha on 28.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class Service {
    
    var name = String()
    var latitude  = Double()
    var longitude = Double()
    var isRecomended = Bool()
    
}

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    let serviceInfoView = ServiceMapInfoView(frame: .zero)
    let mapView         = GMSMapView()
    let searchContainer = UIView()
    var serviceInfoViewBottomConstraint = NSLayoutConstraint()
    
    lazy var locationManager = { () -> CLLocationManager in
        let locationManager =  CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        return locationManager
    }()
    
    var infoViewHeight: CGFloat {
        switch Device.getCurrentDevice() {
        case .iPhoneX:
            return 165
        default:
            return 135
        }
    }
    
    lazy var services = { () -> [Service] in
        
        let serviceOne = Service()
        serviceOne.name = "Huy"
        serviceOne.latitude = 48.521801
        serviceOne.longitude = 35.067067
        serviceOne.isRecomended = false
        
        let serviceTwo = Service()
        serviceTwo.name = "Huy"
        serviceTwo.latitude = 48.530980
        serviceTwo.longitude = 35.072213
        serviceTwo.isRecomended = true
        
        return [serviceOne, serviceTwo]

    }()
    
    // MARK - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupMarkers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.isStatusBarHidden = true
        setTabBarVisible(visible: false, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        locationManager.requestAlwaysAuthorization()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UIApplication.shared.isStatusBarHidden = false
        setTabBarVisible(visible: true, animated: true)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    // MARK: - User actions
    
    @objc func hideInfoView() {
        serviceInfoViewBottomConstraint.constant = infoViewHeight
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func showCurrentUserLocationAction() {
        guard let userCoordinate = mapView.myLocation?.coordinate else { return }
        let userCameraPosition = GMSCameraPosition.camera(withTarget: userCoordinate, zoom: 15.0)
        let cameraUpdate = GMSCameraUpdate.setCamera(userCameraPosition)
        CATransaction.begin()
        CATransaction.setValue(1.5, forKey: kCATransactionAnimationDuration)
        self.mapView.animate(with: cameraUpdate)
        CATransaction.commit()
    }
    
    // MARK: - Help Methods
    
    func setupMarkers() {
        for (i,service) in services.enumerated() {
            let marker = GMSMarker()
            marker.userData = i
            marker.icon = service.isRecomended ? #imageLiteral(resourceName: "mapRecomenendService_pin") : #imageLiteral(resourceName: "mapService_pin")
            marker.isDraggable = false
            marker.position = CLLocationCoordinate2D(latitude: service.latitude, longitude: service.longitude)
            marker.map = self.mapView
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        let markerCameraPosition = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 15.0)

        self.mapView.camera = markerCameraPosition
        locationManager.stopUpdatingLocation()
    }
}
