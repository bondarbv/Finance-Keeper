//
// Finance Keeper
// MainViewController+TableViewExtension.swift

// Created by Bohdan Bondar on 24.08.2022 at 4:32 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/

import UIKit

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
}

//MARK: - UITableViewDataSource
extension MainViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.id) as! TransactionTableViewCell
        return cell
    }
}

//MARK: transactionsTableViewHeader
extension MainViewController {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 75))
        headerView.backgroundColor = .white
        
        let label = UILabel()
        label.frame = CGRect.init(x: 10, y: -25, width: headerView.frame.width, height: headerView.frame.height)
        label.text = "Transactions"
        label.textColor = .gray
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 25)
        headerView.addSubview(label)
        
        return headerView
    }
}
