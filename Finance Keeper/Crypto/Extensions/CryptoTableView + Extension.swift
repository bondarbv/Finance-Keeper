//
// Finance Keeper
// CryptoTableView + Extension.swift

// Created by Bohdan Bondar on 30.07.2022 at 10:36 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

extension CryptoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cryptoViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.id) as! CryptoTableViewCell
        cell.cryptoCellViewModel = cryptoViewModel.cryptoCellViewModel(at: indexPath)
        return cell
    }
}

extension CryptoViewController: UITableViewDelegate {}
