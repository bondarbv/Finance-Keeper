//
// Finance Keeper
// CryptoTableViewCell.swift

// Created by Bohdan Bondar on 30.07.2022 at 10:37 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class CryptoTableViewCell: UITableViewCell {
    
    var stopActivityIndicator: () -> Void = { }
    
    var cryptoCellViewModel: CryptoCellViewModelProtocol! {
        didSet {
            cryptoCellViewModel.fetchCryptoData { [weak self] in
                self?.cryptoCellViewModel.crypto.bind { crypto in
                    DispatchQueue.main.async {
                        self?.cryptoNameLabel.text = "\(crypto.symbol) \(crypto.priceChangePercent) \(crypto.lastPrice)"
                        self?.cryptoNameLabel.backgroundColor = self?.cryptoCellViewModel.priceChangePercentColor
                        self?.stopActivityIndicator()
                    }
                }
            }
        }
    }
    
    static var id = "CryptoTableViewCell"
    
    private let cryptoNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(cryptoNameLabel)
        
        NSLayoutConstraint.activate([
            cryptoNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cryptoNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
    }
}
