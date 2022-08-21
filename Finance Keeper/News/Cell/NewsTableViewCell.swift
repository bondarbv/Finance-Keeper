//
// Finance Keeper
// NewsTableViewCell.swift

// Created by Bohdan Bondar on 31.07.2022 at 5:12 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    var newsCellViewModel: NewsCellViewModelProtocol! {
        didSet {
            newsCellViewModel.article?.bind { [unowned self] value in
                DispatchQueue.main.async {
                    self.titleLabel.text = value.title
                }
            }
        }
    }
    
    static var id = "NewsTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(news: NewsModel, index: IndexPath) {
        titleLabel.text = news.articles[index.row].title
    }
    
    private func layout() {
        addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
