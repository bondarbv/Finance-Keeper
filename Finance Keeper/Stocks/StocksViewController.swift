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
                    self.stocksCollectionView.reloadData()
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

//    private lazy var stocksTableView: UITableView = {
//        let tableView = UITableView()
//        tableView.separatorStyle = .none
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.register(StocksTableViewCell.self, forCellReuseIdentifier: StocksTableViewCell.id)
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
    
    private lazy var stocksCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: (view.frame.size.width - 40) - 4, height: (view.frame.size.height / 6) - 4)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(StocksCollectionViewCell.self, forCellWithReuseIdentifier: StocksCollectionViewCell.id)
        collectionView.frame = view.bounds
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Stocks"
        view.addSubview(stocksCollectionView)
        stocksViewModel = StocksViewModel()
    }
}
