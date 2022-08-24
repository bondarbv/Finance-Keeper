//
// Finance Keeper
// TransactionTableViewCell.swift

// Created by Bohdan Bondar on 24.08.2022 at 4:33 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class TransactionTableViewCell: UITableViewCell {
    
    static let id = "TransactionTableViewCell"
    
    private let transactionValueLabel: UILabel = {
       let label = UILabel()
        label.text = "555$"
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
        addSubview(transactionValueLabel)
        
        NSLayoutConstraint.activate([
            transactionValueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            transactionValueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}
