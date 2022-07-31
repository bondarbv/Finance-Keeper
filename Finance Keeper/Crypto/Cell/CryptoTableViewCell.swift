//
// Finance Keeper
// CryptoTableViewCell.swift

// Created by Bohdan Bondar on 30.07.2022 at 10:37 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    static var id = "CryptoTableViewCell"
    
    private let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(crypto: CryptoModel, index: IndexPath) {
        label.text = crypto.symbols[index.row].symbol
    }
    
    private func layout() {
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
}
