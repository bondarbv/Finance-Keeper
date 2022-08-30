//
// Finance Keeper
// StocksModel.swift

// Created by Bohdan Bondar on 31.07.2022 at 6:46 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

struct StocksModel: Codable {
    let quoteSummary: QuoteSummary
}

struct QuoteSummary: Codable {
    let result: [StockResult]
}

struct StockResult: Codable {
    let price: Price
}

struct Price: Codable {
    let exchangeDataDelayedBy: Int
    let exchange, exchangeName, shortName, longName, currency, currencySymbol, symbol, quoteSourceName: String
    let regularMarketPrice, regularMarketChangePercent: PostMarketChange
}

struct PostMarketChange: Codable {
    let raw: Double
    let fmt: String
}
