//
//  ServiceDetailsVCUserInterface.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import Cosmos
import GoogleMaps

extension ServiceDetailsViewController {
    
    func setupUI() {
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: .clear), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.view.backgroundColor = .white
        
        let backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setImage(#imageLiteral(resourceName: "arrow_icon"), for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        backButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        let leftBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setImage(#imageLiteral(resourceName: "heart_icon"), for: .normal)
        backButton.imageView?.contentMode = .scaleAspectFit
        likeButton.imageView?.contentMode = .scaleAspectFit
        likeButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        likeButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let rightBarButton = UIBarButtonItem(customView: likeButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        let backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.image = #imageLiteral(resourceName: "circlesMain")
        self.view.addSubview(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(ServiceTableViewCell.self, forCellReuseIdentifier: serviceTableViewCellReuseID)
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: contactsTableViewCellReuseID)
        tableView.register(ScheduleTableViewCell.self, forCellReuseIdentifier: scheduleTableViewCellReuseID)
        self.view.addSubview(tableView)
        let navigationBarHeight = self.navigationController?.navigationBar.frame.height
        let statusbarHeight = UIApplication.shared.statusBarFrame.height
        let tableTopOffset = statusbarHeight + navigationBarHeight!
            
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -tableTopOffset).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let tableHederView = UIView(frame: CGRect(x: 0, y: 0, width: AppConstants.screenWidth, height: 286))
        tableHederView.backgroundColor = .clear
        
        let photoSize: CGFloat = AppConstants.isiPad ? 450 : 286
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.screenWidth, height: photoSize)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        detailsPhotosCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        detailsPhotosCollectionView.dataSource = self
        detailsPhotosCollectionView.delegate = self
        detailsPhotosCollectionView.isPagingEnabled = true
        detailsPhotosCollectionView.showsHorizontalScrollIndicator = false
        detailsPhotosCollectionView.backgroundColor = UIColor.white
        detailsPhotosCollectionView.register(DetailPhotoCollectionViewCell.self, forCellWithReuseIdentifier: detailPhotoCollectionViewCellReuseID)
        detailsPhotosCollectionView.translatesAutoresizingMaskIntoConstraints = false
        tableHederView.addSubview(detailsPhotosCollectionView)
        detailsPhotosCollectionView.topAnchor.constraint(equalTo: tableHederView.topAnchor).isActive = true
        detailsPhotosCollectionView.leadingAnchor.constraint(equalTo: tableHederView.leadingAnchor).isActive = true
        detailsPhotosCollectionView.trailingAnchor.constraint(equalTo: tableHederView.trailingAnchor).isActive = true
        detailsPhotosCollectionView.bottomAnchor.constraint(equalTo: tableHederView.bottomAnchor).isActive = true
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.hidesForSinglePage = true
        pageControl.numberOfPages = 3
        pageControl.pageIndicatorTintColor = AppColors.serviceLightGrey
        pageControl.currentPageIndicatorTintColor = AppColors.servicePurpleishBlue
        tableHederView.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: tableHederView.centerXAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: detailsPhotosCollectionView.bottomAnchor, constant: -6).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 7).isActive = true
        
        let ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.backgroundColor = AppColors.servicePurpleishBlue
        ratingLabel.layer.cornerRadius = 35/2
        ratingLabel.layer.masksToBounds = true
        ratingLabel.font = UIFont.systemFont(ofSize: 18)
        ratingLabel.textColor = .white
        ratingLabel.adjustsFontSizeToFitWidth = true
        ratingLabel.text = "5.0"
        ratingLabel.textAlignment = .center
        tableHederView.addSubview(ratingLabel)
        ratingLabel.bottomAnchor.constraint(equalTo: tableHederView.bottomAnchor, constant: -6).isActive = true
        ratingLabel.leadingAnchor.constraint(equalTo: tableHederView.leadingAnchor, constant: 6).isActive = true
        ratingLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        ratingLabel.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        let serviceRaitingView = CosmosView()
        serviceRaitingView.translatesAutoresizingMaskIntoConstraints = false
        serviceRaitingView.settings.fillMode = .precise
        serviceRaitingView.settings.filledColor = AppColors.serviceOrangePink
        serviceRaitingView.settings.emptyColor = AppColors.serviceLightGrey
        serviceRaitingView.settings.filledBorderWidth = 0
        serviceRaitingView.settings.emptyBorderWidth = 0
        serviceRaitingView.settings.starSize = 12
        serviceRaitingView.settings.starMargin = 1
        serviceRaitingView.settings.totalStars = 5
        serviceRaitingView.rating = 5.0
        tableHederView.addSubview(serviceRaitingView)
        serviceRaitingView.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor).isActive = true
        serviceRaitingView.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 6).isActive = true
        
        let serviceStatusLabel = UILabel()
        serviceStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceStatusLabel.backgroundColor = AppColors.serviceCoolGreen
        serviceStatusLabel.layer.cornerRadius = 17/2
        serviceStatusLabel.layer.masksToBounds = true
        serviceStatusLabel.textColor = .white
        serviceStatusLabel.text = "Opened"
        serviceStatusLabel.textAlignment = .center
        serviceStatusLabel.font = UIFont.systemFont(ofSize: 14)
        tableHederView.addSubview(serviceStatusLabel)
        serviceStatusLabel.trailingAnchor.constraint(equalTo: tableHederView.trailingAnchor, constant: -6).isActive = true
        serviceStatusLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        serviceStatusLabel.bottomAnchor.constraint(equalTo: tableHederView.bottomAnchor, constant: -6).isActive = true
        serviceStatusLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 71).isActive = true
        
        let recomendedLabel = UILabel()
        recomendedLabel.translatesAutoresizingMaskIntoConstraints = false
        recomendedLabel.backgroundColor = UIColor.white.withAlphaComponent(0.7)
        recomendedLabel.layer.cornerRadius = 17/2
        recomendedLabel.layer.masksToBounds = true
        recomendedLabel.textColor = AppColors.serviceOrangePink
        recomendedLabel.text = "Recommended "
        recomendedLabel.font = UIFont.systemFont(ofSize: 14)
        recomendedLabel.textAlignment = .center
        tableHederView.addSubview(recomendedLabel)
        recomendedLabel.leadingAnchor.constraint(equalTo: tableHederView.leadingAnchor, constant: 6).isActive = true
        recomendedLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        recomendedLabel.bottomAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: -6).isActive = true
        recomendedLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 120).isActive = true

        tableView.tableHeaderView = tableHederView
        
    }
    
    func setupServiceDetailsOn(headerView: inout UIView) {
        let serviceNameLabel = UILabel()
        serviceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceNameLabel.textAlignment = .center
        serviceNameLabel.textColor = AppColors.serviceSteel
        serviceNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        serviceNameLabel.text = "Apple Service"
        serviceNameLabel.numberOfLines = 3
        headerView.addSubview(serviceNameLabel)
        serviceNameLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 6).isActive = true
        serviceNameLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
        serviceNameLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
        serviceNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        
        let serviceTypeLabel = UILabel()
        serviceTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        serviceTypeLabel.textColor = AppColors.servicePurpleishBlue
        serviceTypeLabel.textAlignment = .center
        serviceTypeLabel.font = UIFont.systemFont(ofSize: 14)
        serviceTypeLabel.text = "Service Type"
        serviceTypeLabel.numberOfLines = 2
        headerView.addSubview(serviceTypeLabel)
        serviceTypeLabel.topAnchor.constraint(equalTo: serviceNameLabel.bottomAnchor).isActive = true
        serviceTypeLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
        serviceTypeLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
        serviceTypeLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
        
        let addressLabel = UILabel()
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.textColor = AppColors.serviceSteel
        addressLabel.textAlignment = .center
        addressLabel.text = "Address strett streAddress strett streAddress strett stre"
        addressLabel.numberOfLines = 2
        addressLabel.font = UIFont.systemFont(ofSize: 12)
        headerView.addSubview(addressLabel)
        addressLabel.topAnchor.constraint(equalTo: serviceTypeLabel.bottomAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
        addressLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 15).isActive = true
        
        let separatorView1 = UIView()
        separatorView1.translatesAutoresizingMaskIntoConstraints = false
        separatorView1.addShadow(opacity: 0.2, radius: 2)
        separatorView1.backgroundColor = AppColors.serviceCoolGreen
        separatorView1.layer.cornerRadius = 1
        headerView.addSubview(separatorView1)
        separatorView1.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 6).isActive = true
        separatorView1.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
        separatorView1.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
        separatorView1.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let companyDetailsButton = UIButton()
        companyDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        companyDetailsButton.backgroundColor = AppColors.serviceOrangePink.withAlphaComponent(0.2)
        companyDetailsButton.layer.cornerRadius = 20
        companyDetailsButton.setTitleColor(AppColors.serviceOrangePink, for: .normal)
        companyDetailsButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        companyDetailsButton.setTitle("See company details", for: .normal)
        headerView.addSubview(companyDetailsButton)
        companyDetailsButton.topAnchor.constraint(equalTo: separatorView1.bottomAnchor, constant: 6).isActive = true
        companyDetailsButton.leadingAnchor.constraint(equalTo: separatorView1.leadingAnchor, constant: 6).isActive = true
        companyDetailsButton.trailingAnchor.constraint(equalTo: separatorView1.trailingAnchor, constant: -6).isActive = true
        companyDetailsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let serviceReviewsButton = UIButton()
        serviceReviewsButton.translatesAutoresizingMaskIntoConstraints = false
        serviceReviewsButton.backgroundColor = AppColors.serviceCoolGreen.withAlphaComponent(0.2)
        serviceReviewsButton.layer.cornerRadius = 20
        serviceReviewsButton.setTitleColor(AppColors.serviceCoolGreen, for: .normal)
        serviceReviewsButton.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        serviceReviewsButton.setTitle("See service reviews", for: .normal)
        headerView.addSubview(serviceReviewsButton)
        serviceReviewsButton.topAnchor.constraint(equalTo: companyDetailsButton.bottomAnchor, constant: 6).isActive = true
        serviceReviewsButton.leadingAnchor.constraint(equalTo: separatorView1.leadingAnchor, constant: 6).isActive = true
        serviceReviewsButton.trailingAnchor.constraint(equalTo: separatorView1.trailingAnchor, constant: -6).isActive = true
        serviceReviewsButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let separatorView2 = UIView()
        separatorView2.translatesAutoresizingMaskIntoConstraints = false
        separatorView2.addShadow(opacity: 0.2, radius: 2)
        separatorView2.backgroundColor = AppColors.serviceCoolGreen
        separatorView2.layer.cornerRadius = 1
        headerView.addSubview(separatorView2)
        separatorView2.topAnchor.constraint(equalTo: serviceReviewsButton.bottomAnchor, constant: 6).isActive = true
        separatorView2.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
        separatorView2.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
        separatorView2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let mapView = GMSMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.isUserInteractionEnabled = false
        mapView.addShadow(opacity: 0.2, radius: 2)
        mapView.layer.cornerRadius = 10
        mapView.layer.masksToBounds = true
        headerView.addSubview(mapView)
        mapView.topAnchor.constraint(equalTo: separatorView2.bottomAnchor, constant: 6).isActive = true
        mapView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
        mapView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
        mapView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        let navigateContainerView = UIView()
        navigateContainerView.translatesAutoresizingMaskIntoConstraints = false
        navigateContainerView.backgroundColor = .white
        navigateContainerView.layer.cornerRadius = 10
        mapView.addSubview(navigateContainerView)
        navigateContainerView.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -6).isActive = true
        navigateContainerView.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 6).isActive = true
        navigateContainerView.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -6).isActive = true
        navigateContainerView.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
        let distanceLabel = UILabel()
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.textColor = AppColors.serviceSteel
        distanceLabel.textAlignment = .center
        distanceLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        distanceLabel.text = "2.45 km"
        navigateContainerView.addSubview(distanceLabel)
        distanceLabel.leadingAnchor.constraint(equalTo: navigateContainerView.leadingAnchor, constant: 6).isActive = true
        distanceLabel.trailingAnchor.constraint(equalTo: navigateContainerView.trailingAnchor, constant: -6).isActive = true
        distanceLabel.bottomAnchor.constraint(equalTo: navigateContainerView.centerYAnchor).isActive = true
        
        let navigateButton = UIButton()
        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        navigateButton.setTitle("Navigate", for: .normal)
        navigateButton.setTitleColor(AppColors.serviceSteel, for: .normal)
        navigateContainerView.addSubview(navigateButton)
        navigateButton.topAnchor.constraint(equalTo: navigateContainerView.centerYAnchor).isActive = true
        navigateButton.leadingAnchor.constraint(equalTo: navigateContainerView.leadingAnchor, constant: 6).isActive = true
        navigateButton.trailingAnchor.constraint(equalTo: navigateContainerView.trailingAnchor, constant: -6).isActive = true
        
        let separatorView3 = UIView()
        separatorView3.translatesAutoresizingMaskIntoConstraints = false
        separatorView3.addShadow(opacity: 0.2, radius: 2)
        separatorView3.backgroundColor = AppColors.serviceDarkSkyBlue
        separatorView3.layer.cornerRadius = 1
        headerView.addSubview(separatorView3)
        separatorView3.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 6).isActive = true
        separatorView3.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
        separatorView3.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
        separatorView3.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        let ourWorkersLabel = UILabel()
        ourWorkersLabel.translatesAutoresizingMaskIntoConstraints = false
        ourWorkersLabel.textColor = AppColors.serviceDarkSkyBlue
        ourWorkersLabel.font = UIFont.systemFont(ofSize: 16)
        ourWorkersLabel.text = "Our Workers"
        headerView.addSubview(ourWorkersLabel)
        ourWorkersLabel.topAnchor.constraint(equalTo: separatorView3.bottomAnchor, constant: 6).isActive = true
        ourWorkersLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
        ourWorkersLabel.trailingAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        
        let seeAllButton = UIButton()
        seeAllButton.translatesAutoresizingMaskIntoConstraints = false
        seeAllButton.backgroundColor = AppColors.serviceDarkSkyBlue.withAlphaComponent(0.2)
        seeAllButton.setTitle("See All", for: .normal)
        seeAllButton.setTitleColor(AppColors.serviceDarkSkyBlue, for: .normal)
        seeAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        seeAllButton.layer.cornerRadius = 11
        headerView.addSubview(seeAllButton)
        seeAllButton.topAnchor.constraint(equalTo: separatorView3.bottomAnchor, constant: 6).isActive = true
        seeAllButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
        seeAllButton.heightAnchor.constraint(equalToConstant: 22).isActive = true
        seeAllButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 93).isActive = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AppConstants.screenWidth, height: 130)
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        workersCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        workersCollectionView.dataSource = self
        workersCollectionView.delegate = self
        workersCollectionView.isPagingEnabled = true
        workersCollectionView.showsHorizontalScrollIndicator = false
        workersCollectionView.backgroundColor = UIColor.white
        workersCollectionView.register(WorkersCollectionViewCell.self, forCellWithReuseIdentifier: workersCollectionViewCellReuseID)
        workersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(workersCollectionView)
        workersCollectionView.topAnchor.constraint(equalTo: seeAllButton.bottomAnchor).isActive = true
        workersCollectionView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        workersCollectionView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        workersCollectionView.heightAnchor.constraint(equalToConstant: 136).isActive = true
        workersCollectionView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
        let leftScrollButton = UIButton()
        leftScrollButton.translatesAutoresizingMaskIntoConstraints = false
        leftScrollButton.setImage(#imageLiteral(resourceName: "arrowLeft_icon"), for: .normal)
        leftScrollButton.imageView?.contentMode = .scaleAspectFit
        headerView.addSubview(leftScrollButton)
        leftScrollButton.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 3).isActive = true
        leftScrollButton.centerYAnchor.constraint(equalTo: workersCollectionView.centerYAnchor).isActive = true
        leftScrollButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
        leftScrollButton.widthAnchor.constraint(equalToConstant: 23).isActive = true
        
        let rightScrollButton = UIButton()
        rightScrollButton.translatesAutoresizingMaskIntoConstraints = false
        rightScrollButton.setImage(#imageLiteral(resourceName: "arrowRight_icon"), for: .normal)
        rightScrollButton.imageView?.contentMode = .scaleAspectFit
        headerView.addSubview(rightScrollButton)
        rightScrollButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -3).isActive = true
        rightScrollButton.centerYAnchor.constraint(equalTo: workersCollectionView.centerYAnchor).isActive = true
        rightScrollButton.heightAnchor.constraint(equalToConstant: 23).isActive = true
        rightScrollButton.widthAnchor.constraint(equalToConstant: 23).isActive = true
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.tableView {
            if let navigationBarHeight = self.navigationController?.navigationBar.frame.height {
                let statusbarHeight = UIApplication.shared.statusBarFrame.height
                let tableTopOffset = statusbarHeight + navigationBarHeight
                let alpha = (scrollView.contentOffset.y + tableTopOffset) / 100
                if alpha >= 0.35 {
                    self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: AppColors.serviceSteel.withAlphaComponent(0.35)), for: .default)
                } else {
                    self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: AppColors.serviceSteel.withAlphaComponent(alpha)), for: .default)
                }
            }
        } else if scrollView == self.detailsPhotosCollectionView {
            let page = scrollView.contentOffset.x / AppConstants.screenWidth
            pageControl.currentPage = Int(page)
        } else if scrollView == workersCollectionView {
//            let page = scrollView.contentOffset.x / AppConstants.screenWidth
            
        }
    }
    
}
