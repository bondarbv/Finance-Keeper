//
// Finance Keeper
// CryptoTableViewCell.swift

// Created by Bohdan Bondar on 30.07.2022 at 10:37 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class CryptoTableViewCell: UITableViewCell {
    
    var cryptoCellViewModel: CryptoCellViewModelProtocol! {
        didSet {
            cryptoCellViewModel.cryptoName.bind { [unowned self] value in
                DispatchQueue.main.async {
                    self.cryptoNameLabel.text = value
                }
            }
        }
    }
    
    static var id = "CryptoTableViewCell"
    
    private let cryptoNameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(cryptoNameLabel)
        
        cryptoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cryptoNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cryptoNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
    }
}
