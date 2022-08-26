//
// Finance Keeper
// NewsModel.swift

// Created by Bohdan Bondar on 31.07.2022 at 4:55 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

struct NewsModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

struct Article: Codable {
    let author, articleDescription, urlToImage, content: String?
    let title, url: String
    let publishedAt: Date
}
