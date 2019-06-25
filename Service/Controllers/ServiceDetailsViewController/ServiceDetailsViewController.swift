//
//  ServiceDetailsViewController.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

class ServiceDetailsViewController: UIViewController {
    
    enum Section: String {
        case serviceDetails = "CompanyDetails"
        case services       = "Services"
        case contacts       = "Contacts"
        case schedule       = "Schedule"
        
        func sectionColor() -> UIColor {
            switch self {
            case .serviceDetails:
                return AppColors.serviceCoolGreen
            case .services:
                return AppColors.servicePurpleishBlue
            case .contacts:
                return AppColors.serviceOrangePink
            case .schedule:
                return AppColors.mediumBlue
            }
        }
    }
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let contactsTableViewCellReuseID = "contactsTableViewCellReuseID"
    let scheduleTableViewCellReuseID = "scheduleTableViewCellReuseID"
    let serviceTableViewCellReuseID  = "serviceTableViewCellReuseID"
    
    var tableSections: [Section] {
        return [.serviceDetails, .services, .contacts, .schedule]
    }
    var detailsPhotosCollectionView: UICollectionView!
    let detailPhotoCollectionViewCellReuseID = "detailPhotoCollectionViewCellReuseID"
    let pageControl = UIPageControl()

    var workersCollectionView: UICollectionView!
    let workersCollectionViewCellReuseID = "workersCollectionViewCellReuseID"
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTabBarVisible(visible: false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        setTabBarVisible(visible: true, animated: true)
    }
    
    // MARK: - User actions
    
    @objc func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
