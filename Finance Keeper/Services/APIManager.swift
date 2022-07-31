//
// Finance Keeper
// APIManager.swift

// Created by Bohdan Bondar on 31.07.2022 at 2:29 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

fileprivate let newsAPIKey = "e9a299488de241d0a29fa210e7cd9905"

struct APIManager {
    static var news = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=\(newsAPIKey)")
    static var binance = URL(string: "https://www.binance.com/api/v3/exchangeInfo")
}
