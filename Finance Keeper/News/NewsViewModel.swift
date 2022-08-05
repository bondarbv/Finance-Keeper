//
// Finance Keeper
// NewsViewModel.swift

// Created by Bohdan Bondar on 06.08.2022 at 2:10 AM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

protocol NewsViewModelProtocol {
    var news: NewsModel { get }
    func numberOfRows() -> Int
    func fetchNews(completion: @escaping () -> Void)
}

final class NewsViewModel: NewsViewModelProtocol {
    var news: NewsModel = NewsModel(status: "", totalResults: 0, articles: [])
    
    func numberOfRows() -> Int {
        news.articles.count
    }
    
    func fetchNews(completion: @escaping () -> Void) {
        NetworkManager.fetch(url: APIManager.news, model: NewsModel.self) { [unowned self] result in
            switch result {
            case .success(let news):
                self.news = news
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
}
