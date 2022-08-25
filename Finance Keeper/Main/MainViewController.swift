//
// Finance Keeper
// MainViewController.swift

// Created by Bohdan Bondar on 30.07.2022 at 2:40 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Balance UI
    private lazy var balanceStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [currentBalanceLabel, currentBalanceValueLabel])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var incomeAndExpenseStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [incomeStackView, expenseStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
        label.textColor = UIColor.tabBarSelectedItemColor
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 25)
        return label
    }()
    
    private let currentBalanceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "5555$"
        label.font = UIFont(name: "BrandonGrotesque-Bold", size: 40)
        return label
    }()
    
    private let incomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Income"
        label.textColor = UIColor.tabBarSelectedItemColor
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        return label
    }()
    
    private let incomeValueLabel: UILabel = {
        let label = UILabel()
        label.text = "6666$"
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        return label
    }()
    
    private let expensesLabel: UILabel = {
        let label = UILabel()
        label.text = "Expenses"
        label.textColor = UIColor.tabBarSelectedItemColor
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        return label
    }()
    
    private let expensesValueLabel: UILabel = {
        let label = UILabel()
        label.text = "1111$"
        label.font = UIFont(name: "BrandonGrotesque-Medium", size: 20)
        return label
    }()
    
    //MARK: - Transaction button
    private lazy var transactionButton: GradientButton = {
        let button = GradientButton()
        button.gradientLayer.cornerRadius = 50
        button.addTarget(self, action: #selector(addTransaction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - TransactionsTableView
    private lazy var transactionsTableVew: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TransactionTableViewCell.self, forCellReuseIdentifier: TransactionTableViewCell.id)
        tableView.separatorStyle = .none
        tableView.rowHeight = 50
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    //MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Main"
        setupBarButtonItems()
        layout()
    }
    
    @objc private func addTransaction() {
        print("add")
    }
    
    private func setupBarButtonItems() {
        let settingsImage = UIImage(named: "settings")
        let filterImage = UIImage(named: "filter")

        navigationItem.leftBarButtonItem = UIBarButtonItem(image: settingsImage, style: .plain, target: self, action: #selector(addTransaction))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.tabBarSelectedItemColor
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: filterImage, style: .plain, target: self, action: #selector(addTransaction))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.tabBarSelectedItemColor
    }
    
    //MARK: - Layout
    private func layout() {
        view.addSubview(balanceStackView)
        view.addSubview(transactionButton)
        view.addSubview(incomeAndExpenseStackView)
        view.addSubview(transactionsTableVew)
        
        NSLayoutConstraint.activate([
            balanceStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            balanceStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            transactionButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            transactionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            transactionButton.widthAnchor.constraint(equalToConstant: 100),
            transactionButton.heightAnchor.constraint(equalToConstant: 100),
            
            incomeAndExpenseStackView.topAnchor.constraint(equalTo: balanceStackView.bottomAnchor, constant: 20),
            incomeAndExpenseStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            incomeAndExpenseStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            transactionsTableVew.topAnchor.constraint(equalTo: incomeAndExpenseStackView.bottomAnchor, constant: 10),
            transactionsTableVew.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            transactionsTableVew.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            transactionsTableVew.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
