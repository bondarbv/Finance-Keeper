//
// Finance Keeper
// CryptoCellViewModel.swift

// Created by Bohdan Bondar on 01.08.2022 at 12:31 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol CryptoCellViewModelProtocol {
    var crypto: Box<CryptoDataModel> { get }
    func fetchCryptoData(completion: @escaping () -> Void)
    init(crypto: Crypto)
}

final class CryptoCellViewModel: CryptoCellViewModelProtocol {
    private var cryptoName: String = ""
    
    var crypto: Box<CryptoDataModel> = Box(CryptoDataModel(symbol: "", lastPrice: "", priceChangePercent: ""))
    
    func fetchCryptoData(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://www.binance.com/api/v3/ticker/24hr?symbol=\(cryptoName)") else { return }
        NetworkManager.fetch(url: url, model: CryptoDataModel.self) { result in
            switch result {
            case .success(let crypto):
                self.crypto.value = crypto
                self.crypto.value.symbol.removeLast(4)
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
