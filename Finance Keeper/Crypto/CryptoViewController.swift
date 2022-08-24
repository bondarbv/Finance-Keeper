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
    
    private lazy var cryptoTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.id)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Crypto"
        layout()
        cryptoViewModel = CryptoViewModel()
    }
    
    private func layout() {
        view.addSubview(cryptoTableView)
        
        NSLayoutConstraint.activate([
            cryptoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cryptoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cryptoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cryptoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
