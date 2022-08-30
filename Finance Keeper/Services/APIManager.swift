//
// Finance Keeper
// APIManager.swift

// Created by Bohdan Bondar on 31.07.2022 at 2:29 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

struct APIManager {
    static let crypto = URL(string: "https://www.binance.com/api/v3/exchangeInfo")
    static var news = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(APIKeys.newsAPIKey)")
    static var stocks = URL(string: "https://api.nasdaq.com/api/screener/stocks?tableonly=true&limit=6000&exchange=NASDAQ")
}
