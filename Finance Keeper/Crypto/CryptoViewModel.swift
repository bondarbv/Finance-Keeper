//
// Finance Keeper
// CryptoViewModel.swift

// Created by Bohdan Bondar on 30.07.2022 at 10:49 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation
import UIKit

protocol CryptoViewModelProtocol: AnyObject {
    var crypto: CryptoModel { get }
    var filteredCrypto: CryptoModel { get set }
    func numberOfRows() -> Int
    func fetchCrypto(completion: @escaping () -> Void)
    func filterContentForSearchText(_ searchText: String)
    func cryptoCellViewModel(at indexPath: IndexPath, isFilteing: Bool) -> CryptoCellViewModelProtocol
}

final class CryptoViewModel: CryptoViewModelProtocol {
    var crypto: CryptoModel = CryptoModel(symbols: [])
    
    var filteredCrypto: CryptoModel = CryptoModel(symbols: [])
    
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
    
    func filterContentForSearchText(_ searchText: String) {
        filteredCrypto.symbols = crypto.symbols.filter({ crypto in
            return crypto.symbol.description.lowercased().contains(searchText.lowercased())
        })
    }
    
    func cryptoCellViewModel(at indexPath: IndexPath, isFilteing: Bool) -> CryptoCellViewModelProtocol {
        if isFilteing == true {
            return CryptoCellViewModel(crypto: filteredCrypto.symbols[indexPath.row])
        } else {
            return CryptoCellViewModel(crypto: crypto.symbols[indexPath.row])
        }
    }
}
