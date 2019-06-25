//
//  SearchVCUserInterface.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UITextFieldDelegate {
    
    func setupUI() {
        hideKeyboardOnTap()
    
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: .clear), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.view.backgroundColor = .white
        
        let mapButton = UIButton()
        mapButton.translatesAutoresizingMaskIntoConstraints = false
        mapButton.setImage(#imageLiteral(resourceName: "map_icon"), for: .normal)
        mapButton.imageView?.contentMode = .scaleAspectFit
        mapButton.addTarget(self, action: #selector(openMapAction), for: .touchUpInside)
        mapButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        mapButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        let leftBarButton = UIBarButtonItem(customView: mapButton)
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let filterButton = UIButton()
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        filterButton.setImage(#imageLiteral(resourceName: "filter_icon"), for: .normal)
        filterButton.imageView?.contentMode = .scaleAspectFit
        filterButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
        filterButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        let rightBarButton = UIBarButtonItem(customView: filterButton)
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
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionFooterHeight = 1
        tableView.estimatedSectionHeaderHeight = 1
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableCell.self, forCellReuseIdentifier: searchTableCellReuseID)
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = AppColors.serviceSteel
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
        tableView.refreshControl = refreshControl
        
        let tableFooter = UIView(frame: CGRect(x: 0, y: 0, width: AppConstants.screenWidth, height: 120))
        tableFooter.backgroundColor = .clear
        
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.color = AppColors.serviceSteel
        activityIndicator.startAnimating()
        tableFooter.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: tableFooter.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: tableFooter.centerYAnchor).isActive = true
        
        tableView.tableFooterView = tableFooter
        
        let tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: AppConstants.screenWidth, height: 154))
        tableHeaderView.backgroundColor = .clear
        
        let tableHeaderAttributedString = NSMutableAttributedString()
        tableHeaderAttributedString.append(AppConstants.attributedStringWith(font: AppConstants.heitiMediumFontWith(scale: 16)!, color: AppColors.serviceSteel, text: "Recomended "))
        tableHeaderAttributedString.append(AppConstants.attributedStringWith(font: AppConstants.heitiMediumFontWith(scale: 16)!, color: AppColors.servicePurpleishBlue, text: "Services."))
        
        let tableHeaderLabel = UILabel()
        tableHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        tableHeaderLabel.attributedText = tableHeaderAttributedString
        tableHeaderView.addSubview(tableHeaderLabel)
        tableHeaderLabel.topAnchor.constraint(equalTo: tableHeaderView.topAnchor, constant: 6).isActive = true
        tableHeaderLabel.leadingAnchor.constraint(equalTo: tableHeaderView.leadingAnchor, constant: 6).isActive = true
        tableHeaderLabel.trailingAnchor.constraint(equalTo: tableHeaderView.trailingAnchor, constant: -6).isActive = true
        tableHeaderLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        
        let collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: 110 - 6, height: 110 - 6)
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 6, bottom: 0, right: 6)
        collectionViewLayout.minimumLineSpacing = 6
        collectionViewLayout.minimumInteritemSpacing = 6
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecomendedCollectionCell.self, forCellWithReuseIdentifier: recomendedCollectionCellReuseID)
        collectionView.showsHorizontalScrollIndicator = false
        tableHeaderView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: tableHeaderLabel.bottomAnchor, constant: 6).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: tableHeaderView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: tableHeaderView.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = AppColors.servicePurpleishBlue
        separatorView.layer.cornerRadius = 1
        tableHeaderView.addSubview(separatorView)
        separatorView.addShadowForRoundedView(opacity: 0.2, radius: 1)
        separatorView.bottomAnchor.constraint(equalTo: tableHeaderView.bottomAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: tableHeaderView.leadingAnchor, constant: 6).isActive = true
        separatorView.trailingAnchor.constraint(equalTo: tableHeaderView.trailingAnchor, constant: -6).isActive = true
        
        tableView.tableHeaderView = tableHeaderView
        
    }
    
    func setupSearchField() {
        let newTextField = UITextField(frame: CGRect(x: 0, y: 0, width: AppConstants.screenWidth, height: 36))
        newTextField.text = searchCaregoryTextField.text
        searchCaregoryTextField = newTextField
        searchCaregoryTextField.delegate = self
        searchCaregoryTextField.returnKeyType = .search
        searchCaregoryTextField.layer.cornerRadius = 10
        searchCaregoryTextField.backgroundColor = UIColor(white: 142.0 / 255.0, alpha: 0.12)
        searchCaregoryTextField.attributedPlaceholder = AppConstants.attributedStringWith(font: UIFont.systemFont(ofSize: 17), color: UIColor(white: 142.0 / 255.0, alpha: 1), text: "Search Category")
        searchCaregoryTextField.leftViewMode = .always
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 36))
        
        let searchImageView = UIImageView()
        searchImageView.translatesAutoresizingMaskIntoConstraints = false
        searchImageView.image = #imageLiteral(resourceName: "searchTabBar").withRenderingMode(.alwaysTemplate)
        searchImageView.tintColor = UIColor(white: 142.0 / 255.0, alpha: 1)
        searchImageView.contentMode = .scaleAspectFit
        leftView.addSubview(searchImageView)
        searchImageView.centerXAnchor.constraint(equalTo: leftView.centerXAnchor).isActive = true
        searchImageView.centerYAnchor.constraint(equalTo: leftView.centerYAnchor).isActive = true
        searchImageView.heightAnchor.constraint(equalToConstant: 15)
        searchImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        searchCaregoryTextField.leftView = leftView
        
        self.navigationItem.titleView = searchCaregoryTextField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
