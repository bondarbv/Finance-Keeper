//
// Finance Keeper
// StocksCollectionViewCell.swift

// Created by Bohdan Bondar on 31.07.2022 at 8:58 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class StocksCollectionViewCell: UICollectionViewCell {
    
    static var id = "StocksTableViewCell"
    
    var stopActivityIndicator: () -> Void = { }
    
    private let stockSymbolLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stockNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stockPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stockPriceChangedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.lightGray.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        gradient.cornerRadius = 20
        return gradient
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(backgroundGradient)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(stocks: StocksModel) {
        stockSymbolLabel.text = stocks.quoteSummary.result[0].price.symbol
        stockNameLabel.text = stocks.quoteSummary.result[0].price.longName
        stockPriceLabel.text = stocks.quoteSummary.result[0].price.regularMarketPrice.fmt + stocks.quoteSummary.result[0].price.currencySymbol
        stockPriceChangedLabel.text = stocks.quoteSummary.result[0].price.regularMarketChangePercent.fmt
        stopActivityIndicator()
    }
    
    private func layout() {
        addSubview(stockSymbolLabel)
        addSubview(stockNameLabel)
        addSubview(stockPriceLabel)
        addSubview(stockPriceChangedLabel)
        
        NSLayoutConstraint.activate([
            stockSymbolLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stockSymbolLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            stockNameLabel.topAnchor.constraint(equalTo: stockSymbolLabel.bottomAnchor, constant: 20),
            stockNameLabel.leadingAnchor.constraint(equalTo: stockSymbolLabel.leadingAnchor),
            
            stockPriceLabel.topAnchor.constraint(equalTo: stockSymbolLabel.topAnchor),
            stockPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            stockPriceChangedLabel.topAnchor.constraint(equalTo: stockPriceLabel.bottomAnchor, constant: 20),
            stockPriceChangedLabel.trailingAnchor.constraint(equalTo: stockPriceLabel.trailingAnchor)
        ])
    }
}
