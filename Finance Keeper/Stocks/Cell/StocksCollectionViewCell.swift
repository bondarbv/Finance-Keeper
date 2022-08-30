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
    
    var stockCollectionViewModel: StocksCollectionViewModelProtocol! {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                stockSymbolLabel.text = stockCollectionViewModel.stock.symbol
                stockSymbolLabel.text = stockCollectionViewModel.stock.symbol
                stockNameLabel.text = stockCollectionViewModel.stock.name
                stockPriceLabel.text = stockCollectionViewModel.stock.lastsale
                var plusOrMinus = ""
                
                if stockCollectionViewModel.stock.pctchange.first == "-" {
                    plusOrMinus = "-"
                    backgroundGradient.colors = [UIColor.red.cgColor, UIColor.darkGray.cgColor]
                } else {
                    plusOrMinus = "+"
                    backgroundGradient.colors = [UIColor.tabBarSelectedItemColor.cgColor, UIColor.darkGray.cgColor]
                }
                
                var percentChange = stockCollectionViewModel.stock.pctchange
                percentChange.removeFirst()
                percentChange.removeLast()
                
                var netChange = stockCollectionViewModel.stock.netchange
                
                if netChange.first == "-" {
                    netChange.removeFirst()
                }
                
                percentChangedLabel.text = plusOrMinus + String(format: "%.02f", Double(percentChange)!) + "%"
                netChangedLabel.text = plusOrMinus + String(format: "%.02f", Double(netChange)!) + "$"
                marketCapLabel.text = stockCollectionViewModel.stock.marketCap + "$"
                stopActivityIndicator()
            }
        }
    }
    
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
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stockPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let percentChangedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .right
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let netChangedLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .right
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let marketCapLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backgroundGradient: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
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
    
    private func layout() {
        addSubview(stockSymbolLabel)
        addSubview(stockNameLabel)
        addSubview(stockPriceLabel)
        addSubview(percentChangedLabel)
        addSubview(netChangedLabel)
        addSubview(marketCapLabel)
        
        NSLayoutConstraint.activate([
            stockSymbolLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            stockSymbolLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            stockNameLabel.topAnchor.constraint(equalTo: stockSymbolLabel.bottomAnchor),
            stockNameLabel.leadingAnchor.constraint(equalTo: stockSymbolLabel.leadingAnchor),
            stockNameLabel.trailingAnchor.constraint(equalTo: stockPriceLabel.leadingAnchor),
            
            stockPriceLabel.topAnchor.constraint(equalTo: stockSymbolLabel.topAnchor),
            stockPriceLabel.widthAnchor.constraint(equalToConstant: 130),
            stockPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            percentChangedLabel.topAnchor.constraint(equalTo: stockPriceLabel.bottomAnchor, constant: 20),
            percentChangedLabel.trailingAnchor.constraint(equalTo: stockPriceLabel.trailingAnchor),
            
            netChangedLabel.topAnchor.constraint(equalTo: percentChangedLabel.bottomAnchor),
            netChangedLabel.trailingAnchor.constraint(equalTo: percentChangedLabel.trailingAnchor),
            
            marketCapLabel.leadingAnchor.constraint(equalTo: stockSymbolLabel.leadingAnchor),
            marketCapLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
