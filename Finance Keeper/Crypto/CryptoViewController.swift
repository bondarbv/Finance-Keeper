//
// Finance Keeper
// CryptoViewController.swift

// Created by Bohdan Bondar on 30.07.2022 at 2:59 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class CryptoViewController: UIViewController {
    
    private var cryptoTableView: UITableView!
    
    var cryptoViewModel: CryptoViewModelProtocol! {
        didSet {
            cryptoViewModel.fetchCrypto { [unowned self] in
                DispatchQueue.main.async {
                    self.cryptoTableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Crypto"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        cryptoViewModel = CryptoViewModel()
    }
    
    private func configureTableView() {
        cryptoTableView = UITableView()
        cryptoTableView.separatorStyle = .none
        cryptoTableView.delegate = self
        cryptoTableView.dataSource = self
        cryptoTableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.id)
        cryptoTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(cryptoTableView)
        
        NSLayoutConstraint.activate([
            cryptoTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cryptoTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cryptoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cryptoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
