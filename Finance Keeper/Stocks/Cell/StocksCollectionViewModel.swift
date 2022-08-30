//
// Finance Keeper
// StocksCollectionViewModel.swift

// Created by Bohdan Bondar on 30.08.2022 at 7:05 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol StocksCollectionViewModelProtocol {
    var stock: Headers { get }
    init(stock: Headers)
}

class StocksCollectionViewModel: StocksCollectionViewModelProtocol {
    var stock: Headers = Headers(symbol: "", name: "", lastsale: "", netchange: "", pctchange: "", marketCap: "", url: "")
    
    required init(stock: Headers) {
        self.stock = stock
    }
}
