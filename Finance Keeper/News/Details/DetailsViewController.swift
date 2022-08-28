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
            DispatchQueue.main.async { [unowned self] in
                self.title = self.detailsViewModel.article.title
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
