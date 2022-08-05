//
// Finance Keeper
// StocksViewModel.swift

// Created by Bohdan Bondar on 06.08.2022 at 2:02 AM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol StocksViewModelProtocol {
    var stocks: StocksModel { get }
    func fetchStocks(completion: @escaping () -> Void)
    func numberOfRows() -> Int
}

class StocksViewModel: StocksViewModelProtocol {
    var stocks: StocksModel = StocksModel(quoteSummary: QuoteSummary(result: []))
    
    func fetchStocks(completion: @escaping () -> Void) {
        NetworkManager.fetch(url: APIManager.stocks, model: StocksModel.self) { [unowned self] result in
            switch result {
            case .success(let stocks):
                self.stocks = stocks
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        stocks.quoteSummary.result.count
    }
}
