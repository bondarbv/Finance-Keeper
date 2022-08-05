//
// Finance Keeper
// CryptoViewModel.swift

// Created by Bohdan Bondar on 30.07.2022 at 10:49 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol CryptoViewModelProtocol {
    var crypto: CryptoModel { get }
    func fetchCrypto(completion: @escaping () -> Void)
    func numberOfRows() -> Int
}

class CryptoViewModel: CryptoViewModelProtocol {
    var crypto: CryptoModel = CryptoModel(symbols: [])
    
    func numberOfRows() -> Int {
        crypto.symbols.count
    }
    
    func fetchCrypto(completion: @escaping () -> Void) {
        NetworkManager.fetch(url: APIManager.crypto, model: CryptoModel.self) { [unowned self] result in
            switch result {
            case .success(let crypto):
                self.crypto = crypto
                self.crypto.symbols.removeAll(where: { $0.symbol.contains("USDT") == false })
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
