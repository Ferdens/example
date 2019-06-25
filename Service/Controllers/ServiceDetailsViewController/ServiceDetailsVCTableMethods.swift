//
//  ServiceDetailsVCTableMethods.swift
//  Service
//
//  Created by anton Shepetuha on 03.08.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

extension ServiceDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionID = tableSections[section]
        switch sectionID {
        case .serviceDetails:
            return 0
        case .services:
            return 3
        case .contacts:
            return 4
        case .schedule:
            return Calendar.current.weekdaySymbols.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionID = tableSections[indexPath.section]
        switch sectionID {
        case .serviceDetails:
            return UITableViewCell()
        case .services:
            let cell = tableView.dequeueReusableCell(withIdentifier: serviceTableViewCellReuseID, for: indexPath) as! ServiceTableViewCell
            cell.serviceNameLabel.text = "Service Name"
            cell.serviceCategoryLabel.text = "ServiceCategory"
            if indexPath.row == 1 {
                cell.serviceNameLabel.text = "Service NaService NameService NameService NameService NameService NameService NameService Nameme"
            }
            return cell
        case .contacts:
            let cell = tableView.dequeueReusableCell(withIdentifier: contactsTableViewCellReuseID, for: indexPath) as! ContactsTableViewCell
            cell.contactLabel.text = "Manager Email: manager@gmail.com"
            if indexPath.row == 1 {
                cell.contactLabel.text = "Director Email: directooooooooooooooooooooooooooooor@gmail.com"
            }
            if indexPath.row == 2 {
                cell.contactLabel.text = "Manager: +380986929412"
            }
            return cell
        case .schedule:
            let cell = tableView.dequeueReusableCell(withIdentifier: scheduleTableViewCellReuseID, for: indexPath) as! ScheduleTableViewCell
            cell.titleLabel.text = Calendar.current.weekdaySymbols[indexPath.row]
            cell.dataLabel.text = "10:00 - 20:00"
            if indexPath.row == 3 {
                cell.dataLabel.text = "Closed"
                cell.dataLabel.textColor = AppColors.serviceRed
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionID = tableSections[section]
        var headerView = UIView()
        headerView.backgroundColor = .clear
        switch sectionID {
        case .serviceDetails:
            setupServiceDetailsOn(headerView: &headerView)
        case .services, .contacts, .schedule :
            let separatorView = UIView()
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            separatorView.addShadow(opacity: 0.2, radius: 2)
            separatorView.backgroundColor = sectionID.sectionColor()
            separatorView.layer.cornerRadius = 1
            headerView.addSubview(separatorView)
            separatorView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 0).isActive = true
            separatorView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
            separatorView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -6).isActive = true
            separatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
            
            let headerLabel = UILabel()
            headerLabel.translatesAutoresizingMaskIntoConstraints = false
            headerLabel.textColor = sectionID.sectionColor()
            headerLabel.font = UIFont.systemFont(ofSize: 16)
            headerLabel.text = sectionID.rawValue
            headerView.addSubview(headerLabel)
            headerLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 6).isActive = true
            headerLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 6).isActive = true
            headerLabel.trailingAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
            headerLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 6
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
}
