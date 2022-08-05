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
        cell.setupCell(news: newsViewModel.news, index: indexPath)
        return cell
    }
}

extension NewsViewController: UITableViewDelegate {
    
}

