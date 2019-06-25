//
//  SearchViewController.swift
//  Service
//
//  Created by anton Shepetuha on 14.07.2018.
//  Copyright © 2018 Anton. All rights reserved.
//

import Foundation
import  UIKit

class SearchViewController: UIViewController {
    
    var searchCaregoryTextField = UITextField()
    
    let tableView = UITableView(frame: .zero, style: .grouped)
    let searchTableCellReuseID = "searchTableCellReuseID"
    
    var collectionView: UICollectionView!
    let recomendedCollectionCellReuseID = "recomendedCollectionCellReuseID"
    
    // MARK: - Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupSearchField()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    
    // MARK: - User Actions
    
    @objc func openMapAction() {
        let mapVC = MapViewController()
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @objc func refresh(_ refreshControl: UIRefreshControl) {
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
            refreshControl.endRefreshing()
        }
    }
    
}
