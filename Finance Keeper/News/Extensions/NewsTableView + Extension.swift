//
// Finance Keeper
// NewsTableView + Extension.swift

// Created by Bohdan Bondar on 31.07.2022 at 5:09 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.id) as! NewsTableViewCell
        cell.newsCellViewModel = newsViewModel.newsCellViewModel(at: indexPath)
        cell.stopActivityIndicator = { [unowned self] in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.newsTableView.beginUpdates()
                self.newsTableView.endUpdates()
            }
        }
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! NewsTableViewCell
        let detailsViewController = DetailsViewController()
        detailsViewController.detailsViewModel = cell.newsCellViewModel.detailsViewModelProtocol()
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

