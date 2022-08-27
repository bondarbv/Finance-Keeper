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
                let day = value.publishedAt
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd, yyyy"
                let date = dateFormatter.string(from: day)
                
                let publishedAt = value.publishedAt
                dateFormatter.dateFormat = "HH:mm"
                let time = dateFormatter.string(from: publishedAt)
                
                DispatchQueue.main.async {
                    self.titleLabel.text = value.title
                    self.dateLabel.text =
                    """
                    \(time)
                    \(date)
                    """

                    if let author = self.authorLabel.text {
                        self.authorLabel.text =
                        """
                        Source:
                        \(author)
                        """
                    } else {
                        self.authorLabel.text =
                        """
                        Source:
                        No news source
                        """
                    }
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
        label.numberOfLines = 0
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
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
        let day = news.articles[index.row].publishedAt
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let date = dateFormatter.string(from: day)
        
        let publishedAt = news.articles[index.row].publishedAt
        dateFormatter.dateFormat = "HH:mm"
        let time = dateFormatter.string(from: publishedAt)
        
        titleLabel.text = news.articles[index.row].title
        dateLabel.text =
        """
        \(time)
        \(date)
        """
        
        if let author = news.articles[index.row].author {
            authorLabel.text =
            """
            Source:
            \(author)
            """
        } else {
            authorLabel.text =
            """
            Source:
            No news source
            """
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
            dateLabel.widthAnchor.constraint(equalToConstant: 130),
            
            separatorView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
