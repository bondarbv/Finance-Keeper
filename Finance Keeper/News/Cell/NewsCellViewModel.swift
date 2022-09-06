//
// Finance Keeper
// NewsCellViewModel.swift

// Created by Bohdan Bondar on 09.08.2022 at 2:02 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol NewsCellViewModelProtocol: AnyObject {
    var article: Box<Article> { get }
    func detailsViewModelProtocol() -> DetailsViewModelProtocol
    init(article: Article)
}

final class  NewsCellViewModel: NewsCellViewModelProtocol {
    var article: Box<Article> = Box(Article(source: Source(name: ""), author: "", articleDescription: "", urlToImage: "", content: "", title: "", url: "", publishedAt: .distantFuture))
    
    func detailsViewModelProtocol() -> DetailsViewModelProtocol {
        DetailsViewModel(article: self.article.value)
    }
    
    required init(article: Article) {
        self.article.value = article
    }
}
