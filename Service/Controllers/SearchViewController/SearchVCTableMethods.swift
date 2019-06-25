//
//  SearchVCTableMethods.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: searchTableCellReuseID, for: indexPath) as! SearchTableCell
        cell.servicePhotoImageView.image = #imageLiteral(resourceName: "apple")
        cell.serviceNameLabel.text = "Apple Service"
        cell.serviceRaitingView.rating = 5.0
        cell.serviceRatingLabel.text = "5.0"
        cell.serviceTypeLabel.text = "Electronica"
        cell.serviceAddressLabel.text = "AddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddressAddress"
        cell.serviceDistanceLabel.text = "0.17 km"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = UIView()
        sectionHeaderView.backgroundColor = .clear
        
        let headerLabelText = NSMutableAttributedString()
        headerLabelText.append(AppConstants.attributedStringWith(font: AppConstants.heitiMediumFontWith(scale: 16)!, color: AppColors.serviceSteel, text: "Nearest "))
        headerLabelText.append(AppConstants.attributedStringWith(font: AppConstants.heitiMediumFontWith(scale: 16)!, color: AppColors.servicePurpleishBlue, text: "Services."))
        
        let headerLabel = UILabel()
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.attributedText = headerLabelText
        sectionHeaderView.addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: sectionHeaderView.topAnchor, constant: 6).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: sectionHeaderView.leadingAnchor, constant: 6).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: sectionHeaderView.trailingAnchor, constant: -6).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        headerLabel.bottomAnchor.constraint(equalTo: sectionHeaderView.bottomAnchor, constant: -6).isActive = true
        
        return sectionHeaderView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let serviceDetailsVC = ServiceDetailsViewController()
        self.navigationController?.pushViewController(serviceDetailsVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView == self.tableView else {return}
        if let navigationBarHeight = self.navigationController?.navigationBar.frame.height {
            let statusbarHeight = UIApplication.shared.statusBarFrame.height
            let tableTopOffset = statusbarHeight + navigationBarHeight
            if scrollView.contentOffset.y <= -(tableTopOffset) {
                let color = UIColor(white: 142.0 / 255.0, alpha: 0.12)
                if let currentColor = searchCaregoryTextField.backgroundColor {
                    if currentColor != color {
                        searchCaregoryTextField.backgroundColor = color
                    }
                }
            } else {
                let color = UIColor.white
                if let currentColor = searchCaregoryTextField.backgroundColor {
                    if currentColor != color {
                        searchCaregoryTextField.backgroundColor = color
                    }
                }
            }
            let alpha = (scrollView.contentOffset.y + tableTopOffset) / 100
            if alpha >= 0.35 {
                self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: AppColors.serviceSteel.withAlphaComponent(0.35)), for: .default)
            } else {
                self.navigationController?.navigationBar.setBackgroundImage(UIImage.imageFromColor(color: AppColors.serviceSteel.withAlphaComponent(alpha)), for: .default)
            }
        }
    }
    
}
