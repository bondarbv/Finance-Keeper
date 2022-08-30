//
// Finance Keeper
// StocksModel.swift

// Created by Bohdan Bondar on 31.07.2022 at 6:46 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

struct StocksTestModel: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let table: Table
    let totalrecords: Int
}

struct Table: Codable {
    let rows: [Headers]
}

struct Headers: Codable {
    let symbol, name, lastsale, netchange: String
    let pctchange, marketCap: String
    let url: String?
}
