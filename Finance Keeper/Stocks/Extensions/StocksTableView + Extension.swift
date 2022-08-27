//
// Finance Keeper
// StocksTableView + Extension.swift

// Created by Bohdan Bondar on 31.07.2022 at 8:57 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

extension StocksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stocksViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StocksTableViewCell.id) as! StocksTableViewCell
        cell.setupCell(stocks: stocksViewModel.stocks.value)
        return cell
    }
}

extension StocksViewController: UITableViewDelegate {
    
}
