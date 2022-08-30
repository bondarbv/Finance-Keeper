//
// Finance Keeper
// StocksViewModel.swift

// Created by Bohdan Bondar on 06.08.2022 at 2:02 AM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol StocksViewModelProtocol {
    var stocks: Box<StocksTestModel> { get }
    func numberOfRows() -> Int
    func fetchStocks(completion: @escaping () -> Void)
}

final class StocksViewModel: StocksViewModelProtocol {
    var stocks: Box<StocksTestModel> = Box(StocksTestModel(data: DataClass(table: Table(rows: [Headers(symbol: "", name: "", lastsale: "", netchange: "", pctchange: "", marketCap: "", url: "")]), totalrecords: 0)))
    
    func numberOfRows() -> Int {
        stocks.value.data.totalrecords
    }
    
    func fetchStocks(completion: @escaping () -> Void) {
        NetworkManager.fetch(url: APIManager.stocks, model: StocksTestModel.self) { [unowned self] result in
            switch result {
            case .success(let stocks):
                self.stocks.value = stocks
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
