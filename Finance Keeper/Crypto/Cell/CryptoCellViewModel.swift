//
// Finance Keeper
// CryptoCellViewModel.swift

// Created by Bohdan Bondar on 01.08.2022 at 12:31 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation
import UIKit.UIColor

protocol CryptoCellViewModelProtocol {
    var crypto: Box<CryptoDataModel> { get }
    var priceChangePercentColor: UIColor? { get }
    func fetchCryptoData(completion: @escaping () -> Void)
    init(crypto: Crypto)
}

final class CryptoCellViewModel: CryptoCellViewModelProtocol {
    private var cryptoName: String = ""
    
    var crypto: Box<CryptoDataModel> = Box(CryptoDataModel(symbol: "", lastPrice: "", priceChangePercent: ""))
    
    var priceChangePercentColor: UIColor?
    
    func fetchCryptoData(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://www.binance.com/api/v3/ticker/24hr?symbol=\(cryptoName)") else { return }
        NetworkManager.fetch(url: url, model: CryptoDataModel.self) { result in
            switch result {
            case .success(let crypto):
                if Double(crypto.lastPrice) != 0.00000000 {
                    self.crypto.value = crypto
                    self.crypto.value.symbol.removeLast(4)
                    self.crypto.value.priceChangePercent = "\(String(format: "%.02f", Double(crypto.priceChangePercent)!))%"
                    
                    if self.crypto.value.priceChangePercent.prefix(1) == "-" {
                        self.priceChangePercentColor = .red
                    } else {
                        self.crypto.value.priceChangePercent.insert("+", at: self.crypto.value.priceChangePercent.startIndex)
                        self.priceChangePercentColor = UIColor.tabBarSelectedItemColor
                    }
                }
                
                for _ in self.crypto.value.lastPrice {
                    if self.crypto.value.lastPrice.last == "0" || self.crypto.value.lastPrice.last == "." {
                        self.crypto.value.lastPrice.removeLast()
                    }
                }
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    required init(crypto: Crypto) {
        self.cryptoName = crypto.symbol
    }
}
