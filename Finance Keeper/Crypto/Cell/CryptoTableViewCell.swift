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
                        self?.cryptoNameLabel.text = crypto.symbol
                        self?.cryptoPriceLabel.text = crypto.lastPrice
                        self?.cryptoPriceChangeLabel.text = crypto.priceChangePercent
                        self?.cryptoPriceChangeLabel.layer.backgroundColor = self?.cryptoCellViewModel.priceChangePercentColor?.cgColor
                        self?.stopActivityIndicator()
                    }
                }
            }
        }
    }
    
    static var id = "CryptoTableViewCell"
    
    private lazy var cryptoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cryptoNameLabel, cryptoPriceLabel, cryptoPriceChangeLabel])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.setCustomSpacing(20, after: cryptoPriceLabel)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let cryptoNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        return label
    }()
    
    private let cryptoPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        return label
    }()
    
    private let cryptoPriceChangeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        label.layer.cornerRadius = 5
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
        addSubview(cryptoStackView)
        
        NSLayoutConstraint.activate([
            cryptoStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            cryptoStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cryptoStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            cryptoPriceChangeLabel.heightAnchor.constraint(equalToConstant: 40),
            cryptoPriceChangeLabel.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
}
