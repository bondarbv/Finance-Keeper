//
// Finance Keeper
// StocksTableViewCell.swift

// Created by Bohdan Bondar on 31.07.2022 at 8:58 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class StocksTableViewCell: UITableViewCell {
    
    static var id = "StocksTableViewCell"
    
    private let stockNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(stocks: StocksModel) {
        stockNameLabel.text = stocks.quoteSummary.result[0].price.symbol
    }
    
    private func layout() {
        addSubview(stockNameLabel)
        
        stockNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stockNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stockNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
        ])
    }
}
