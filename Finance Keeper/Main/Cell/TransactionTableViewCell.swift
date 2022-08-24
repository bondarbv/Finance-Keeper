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
    
    private let transactionLabel: UILabel = {
       let label = UILabel()
        label.text = "Groceries"
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionValueLabel: UILabel = {
       let label = UILabel()
        label.text = "-555$"
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let transactionImageView: UIImageView = {
        let image = UIImage(named: "groceries")
        let imageView = UIImageView(image: image?.withTintColor(UIColor.tabBarSelectedItemColor))
        imageView.tintColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(transactionLabel)
        addSubview(transactionValueLabel)
        addSubview(transactionImageView)
        
        NSLayoutConstraint.activate([
            transactionImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            transactionImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            transactionImageView.heightAnchor.constraint(equalToConstant: 30),
            transactionImageView.widthAnchor.constraint(equalToConstant: 30),
            
            transactionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            transactionLabel.leadingAnchor.constraint(equalTo: transactionImageView.trailingAnchor, constant: 10),
            
            transactionValueLabel.topAnchor.constraint(equalTo: transactionLabel.topAnchor),
            transactionValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
