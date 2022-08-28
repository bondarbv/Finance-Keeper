//
// Finance Keeper
// DetailsViewController.swift

// Created by Bohdan Bondar on 28.08.2022 at 3:40 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class DetailsViewController: UIViewController {
    
    var detailsViewModel: DetailsViewModelProtocol! {
        didSet {
            articleImageView.load(detailsViewModel.article.urlToImage)
            DispatchQueue.main.async { [unowned self] in
                self.titleLabel.text = self.detailsViewModel.article.title
                self.contentLabel.text = self.detailsViewModel.article.content
                if detailsViewModel.article.urlToImage == nil {
                    self.articleImageView.isHidden = true
                }
            }
        }
    }
    
    private lazy var articleStackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [titleLabel, articleImageView, contentLabel])
        stackView.axis = .vertical
        stackView.alignment = .firstBaseline
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        return label
    }()
    
    private let articleImageView: UIImageView = {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "BrandonGrotesque-Regular", size: 20)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "News"
        navigationController?.navigationBar.tintColor = UIColor.tabBarSelectedItemColor
        layout()
    }
    
    private func layout() {
        view.addSubview(articleStackView)
        
        NSLayoutConstraint.activate([
            articleStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            articleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            articleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            articleImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
