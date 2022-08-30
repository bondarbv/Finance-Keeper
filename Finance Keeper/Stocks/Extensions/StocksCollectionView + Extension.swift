//
// Finance Keeper
// StocksCollectionView + Extension.swift

// Created by Bohdan Bondar on 31.07.2022 at 8:57 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

extension StocksViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stocksViewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StocksCollectionViewCell.id, for: indexPath) as! StocksCollectionViewCell
        cell.stockCollectionViewModel = stocksViewModel.stocksCollectionViewModel(at: indexPath)
        cell.stopActivityIndicator = {
            self.activityIndicator.stopAnimating()
        }
        return cell
    }
}

extension StocksViewController: UICollectionViewDelegate {}
