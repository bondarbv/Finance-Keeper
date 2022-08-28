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
        if isFiltering {
            return cryptoViewModel.filteredCrypto.symbols.count
        }
        return cryptoViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.id) as! CryptoTableViewCell
        cell.cryptoCellViewModel = cryptoViewModel.cryptoCellViewModel(at: indexPath, isFilteing: isFiltering)
        cell.stopActivityIndicator = { [unowned self] in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.cryptoTableView.beginUpdates()
                self.cryptoTableView.endUpdates()
            }
        }
        return cell
    }
}

extension CryptoViewController: UITableViewDelegate {}

extension CryptoViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        cryptoViewModel.filterContentForSearchText(text)
        cryptoTableView.reloadData()
    }
}
