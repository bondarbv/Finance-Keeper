//
// Finance Keeper
// NewsTableViewCell.swift

// Created by Bohdan Bondar on 31.07.2022 at 5:12 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    var stopActivityIndicator: () -> Void = { }
    
    var newsCellViewModel: NewsCellViewModelProtocol! {
        didSet {
            newsCellViewModel.article.bind { [unowned self] value in
                let day = value.publishedAt
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM dd, yyyy"
                let date = dateFormatter.string(from: day)
                
                let publishedAt = value.publishedAt
                dateFormatter.dateFormat = "HH:mm"
                let time = dateFormatter.string(from: publishedAt)
                
                DispatchQueue.main.async {
                    self.titleLabel.text = value.title
                    self.descriptionLabel.text = value.articleDescription?.description
                    self.dateLabel.text =
                    """
                    \(time)
                    \(date)
                    """
                    self.sourceLabel.text =
                    """
                    Source:
                    \(value.source.name)
                    """
                    self.stopActivityIndicator()
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
    
    private let descriptionLabel: UILabel = {
      let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sourceLabel: UILabel = {
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
    
    private func layout() {
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(sourceLabel)
        addSubview(dateLabel)
        addSubview(separatorView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            sourceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            sourceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            sourceLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: sourceLabel.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 130),
            
            separatorView.topAnchor.constraint(equalTo: sourceLabel.bottomAnchor, constant: 10),
            separatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 2)
        ])
    }
}
