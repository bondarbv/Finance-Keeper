//
// Finance Keeper
// CryptoCellViewModel.swift

// Created by Bohdan Bondar on 01.08.2022 at 12:31 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol CryptoCellViewModelProtocol {
    var cryptoName: Box<String> { get }
    init(crypto: Crypto)
}

final class CryptoCellViewModel: CryptoCellViewModelProtocol {
    var cryptoName: Box<String> = Box("")
    
    required init(crypto: Crypto) {
        self.cryptoName.value = crypto.symbol
    }
}
