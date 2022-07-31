//
// Finance Keeper
// StocksViewController.swift

// Created by Bohdan Bondar on 30.07.2022 at 2:59 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class StocksViewController: UIViewController {
    
    var stocks: StocksModel?

    private var stocksTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Stocks"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        NetworkManager.fetch(url: APIManager.stocks, model: StocksModel.self) { result in
            switch result {
            case .success(let stocks):
                self.stocks = stocks
                DispatchQueue.main.async { [unowned self] in
                    self.stocksTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func configureTableView() {
        stocksTableView = UITableView()
        stocksTableView.separatorStyle = .none
        stocksTableView.delegate = self
        stocksTableView.dataSource = self
        stocksTableView.register(StocksTableViewCell.self, forCellReuseIdentifier: StocksTableViewCell.id)
        stocksTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stocksTableView)
        
        NSLayoutConstraint.activate([
            stocksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stocksTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stocksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stocksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
