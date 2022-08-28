//
// Finance Keeper
// StocksViewController.swift

// Created by Bohdan Bondar on 30.07.2022 at 2:59 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class StocksViewController: UIViewController {
    
    var stocksViewModel: StocksViewModelProtocol! {
        didSet {
            stocksViewModel.fetchStocks { [unowned self] in
                DispatchQueue.main.async {
                    self.stocksTableView.reloadData()
                }
            }
        }
    }
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    private lazy var stocksTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StocksTableViewCell.self, forCellReuseIdentifier: StocksTableViewCell.id)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Stocks"
        layout()
        stocksViewModel = StocksViewModel()
    }
    
    private func layout() {
        view.addSubview(stocksTableView)
        view.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            stocksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stocksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stocksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stocksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
