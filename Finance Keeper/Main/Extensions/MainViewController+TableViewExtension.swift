//
// Finance Keeper
// MainViewController+TableViewExtension.swift

// Created by Bohdan Bondar on 24.08.2022 at 4:32 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/

import UIKit

extension MainViewController: UITableViewDelegate {
    
}

extension MainViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TransactionTableViewCell.id) as? TransactionTableViewCell else { return UITableViewCell() }
        return cell
    }
}
