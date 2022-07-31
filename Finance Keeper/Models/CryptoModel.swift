//
// Finance Keeper
// CryptoModel.swift

// Created by Bohdan Bondar on 30.07.2022 at 5:08 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

struct CryptoModel: Codable {
    var symbols: [Crypto]
}

struct Crypto: Codable {
    let symbol: String
    let quoteAsset: QuoteAsset
}

enum QuoteAsset: String, Codable {
    case aud = "AUD"
    case bidr = "BIDR"
    case bkrw = "BKRW"
    case bnb = "BNB"
    case brl = "BRL"
    case btc = "BTC"
    case busd = "BUSD"
    case bvnd = "BVND"
    case dai = "DAI"
    case doge = "DOGE"
    case dot = "DOT"
    case eth = "ETH"
    case eur = "EUR"
    case gbp = "GBP"
    case idrt = "IDRT"
    case ngn = "NGN"
    case pax = "PAX"
    case quoteAssetTRY = "TRY"
    case rub = "RUB"
    case trx = "TRX"
    case tusd = "TUSD"
    case uah = "UAH"
    case usdc = "USDC"
    case usdp = "USDP"
    case usds = "USDS"
    case usdt = "USDT"
    case ust = "UST"
    case vai = "VAI"
    case xrp = "XRP"
    case zar = "ZAR"
}
