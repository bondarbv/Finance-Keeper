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
                let date = value.publishedAt
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "HH:mm"
                
                DispatchQueue.main.async {
                    self.titleLabel.text = value.title
                    self.authorLabel.text = value.author
                    self.dateLabel.text = dateFormatter.string(from: date)
                }
            }
        }
    }
    
    static var id = "NewsTableViewCell"
    
    private let separatorView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor.tabBarSelectedItemColor
        view.layer.cornerRadius = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        label.textAlignment = .right
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
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
        let date = news.articles[index.row].publishedAt
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        titleLabel.text = news.articles[index.row].title
        dateLabel.text = dateFormatter.string(from: date)
        
        if news.articles[index.row].author != nil {
            authorLabel.text = news.articles[index.row].author
        } else {
            authorLabel.text = "No news source"
        }
    }
    
    private func layout() {
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(dateLabel)
        addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: authorLabel.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 60),
            
            separatorView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
