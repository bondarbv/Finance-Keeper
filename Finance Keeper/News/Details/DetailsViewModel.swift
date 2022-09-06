//
// Finance Keeper
// DetailsViewModel.swift

// Created by Bohdan Bondar on 28.08.2022 at 3:45 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol DetailsViewModelProtocol: AnyObject {
    var article: Article { get }
    init(article: Article)
}

final class DetailsViewModel: DetailsViewModelProtocol {
    var article: Article = Article(source: Source(name: ""), author: "", articleDescription: "", urlToImage: "", content: "", title: "", url: "", publishedAt: .distantFuture)
    
    init(article: Article) {
        self.article = article
    }
}
