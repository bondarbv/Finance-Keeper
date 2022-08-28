//
// Finance Keeper
// CryptoViewController.swift

// Created by Bohdan Bondar on 30.07.2022 at 2:59 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class CryptoViewController: UIViewController {
    
    var cryptoViewModel: CryptoViewModelProtocol! {
        didSet {
            cryptoViewModel.fetchCrypto { [unowned self] in
                DispatchQueue.main.async {
                    self.cryptoTableView.reloadData()
                }
            }
        }
    }
    
    private var cryptoSearchBarIsEmpty: Bool {
        guard let text = cryptoSearchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        return cryptoSearchController.isActive && !cryptoSearchBarIsEmpty
    }
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    lazy var cryptoTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.id)
        tableView.rowHeight = 60
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private lazy var cryptoSearchController: UISearchController = {
       let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.definesPresentationContext = true
        searchController.searchBar.placeholder = "Search for cryptocurrency"
        return searchController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Crypto"
        navigationItem.searchController = cryptoSearchController
        layout()
        cryptoViewModel = CryptoViewModel()
    }
    
    private func layout() {
        view.addSubview(cryptoTableView)
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            cryptoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cryptoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cryptoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cryptoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
