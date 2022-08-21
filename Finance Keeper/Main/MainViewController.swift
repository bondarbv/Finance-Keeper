//
// Finance Keeper
// MainViewController.swift

// Created by Bohdan Bondar on 30.07.2022 at 2:40 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class MainViewController: UIViewController {
    
    private lazy var balanceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [currentBalanceLabel,
                                                       currentBalanceValueLabel,
                                                       incomeAndExpenseStackView])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var incomeAndExpenseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeStackView, expenseStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var incomeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeLabel, incomeValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var expenseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [expensesLabel, expensesValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let currentBalanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Current Balance"
        return label
    }()
    
    private let currentBalanceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "5555$"
        return label
    }()
    
    private let incomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Income"
        return label
    }()
    
    private let incomeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "6666$"
        return label
    }()
    
    private let expensesLabel: UILabel = {
        let label = UILabel()
        label.text = "Expenses"
        return label
    }()
    
    private let expensesValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1111$"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = true
        layout()
    }
    
    private func layout() {
        view.addSubview(balanceStackView)
        
        NSLayoutConstraint.activate([
            balanceStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            balanceStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
