//
// Finance Keeper
// CryptoDataModel.swift

// Created by Bohdan Bondar on 27.08.2022 at 12:08 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

struct CryptoDataModel: Codable {
    var symbol: String
    let lastPrice, priceChangePercent: String
}
