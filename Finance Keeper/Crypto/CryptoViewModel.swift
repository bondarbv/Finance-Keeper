//
// Finance Keeper
// CryptoViewModel.swift

// Created by Bohdan Bondar on 30.07.2022 at 10:49 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol CryptoViewModelProtocol {
    var crypto: Box<[CryptoModel]> { get }
    func numberOfRows() -> Int
    func fetchCrypto(completion: @escaping () -> Void)
}

class CryptoViewModel: CryptoViewModelProtocol {
    var crypto: Box<[CryptoModel]> = Box([])
    
    func numberOfRows() -> Int {
        crypto.value.count
    }
    
    func fetchCrypto(completion: @escaping () -> Void) {
        NetworkManager.fetch(url: APIManager.crypto, model: CryptoModel.self) { result in
            switch result {
            case .success(let crypto):
                print(crypto)
//                self.crypto.value = Box([crypto])
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
