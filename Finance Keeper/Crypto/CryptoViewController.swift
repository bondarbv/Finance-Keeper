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
    
    var crypto: CryptoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Crypto"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        NetworkManager.fetch(url: APIManager.binance, model: CryptoModel.self) { result in
            switch result {
            case .success(let crypto):
                    self.crypto = crypto
                    self.crypto?.symbols.removeAll(where: { $0.symbol.contains("USDT") == false })
                DispatchQueue.main.async { [weak self] in
                    self?.cryptoTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
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
            cryptoTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cryptoTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cryptoTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
