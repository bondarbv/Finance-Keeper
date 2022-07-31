//
// Finance Keeper
// NewsViewController.swift

// Created by Bohdan Bondar on 30.07.2022 at 2:59 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class NewsViewController: UIViewController {
    
    var news: NewsModel?
    
    private var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        configureTableView()
        NetworkManager.fetch(url: APIManager.news, model: NewsModel.self) { result in
            switch result {
            case .success(let news):
                self.news = news
                DispatchQueue.main.async { [unowned self] in
                    self.newsTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func configureTableView() {
        newsTableView = UITableView()
        newsTableView.separatorStyle = .none
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(NewsTableViewCell.self, forCellReuseIdentifier: NewsTableViewCell.id)
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(newsTableView)
        
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
