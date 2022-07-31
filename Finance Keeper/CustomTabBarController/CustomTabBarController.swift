//
// Finance Keeper
// CustomTabBarController.swift

// Created by Bohdan Bondar on 30.07.2022 at 2:57 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        let mainViewController = UINavigationController(rootViewController: MainViewController())
        let newsViewController = UINavigationController(rootViewController: NewsViewController())
        let stocksViewController = UINavigationController(rootViewController: StocksViewController())
        let cryptoViewController = UINavigationController(rootViewController: CryptoViewController())
        
        guard let mainImage = UIImage(named: "main") else { return }
        guard let newsImage = UIImage(named: "news") else { return }
        guard let stocksImage = UIImage(named: "stocks") else { return }
        guard let cryptoImage = UIImage(named: "crypto") else { return }
        
        viewControllers = [
            generateViewController(viewController: mainViewController,
                                   title: "Main",
                                   image: mainImage),
            
            generateViewController(viewController: newsViewController,
                                   title: "News",
                                   image: newsImage),
            
            generateViewController(viewController: stocksViewController,
                                   title: "Stocks",
                                   image: stocksImage),
            
            generateViewController(viewController: cryptoViewController,
                                   title: "Crypto",
                                   image: cryptoImage)
        ]
    }
    
    private func generateViewController(viewController: UINavigationController, title: String, image: UIImage) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 10
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX,
                                                          y: tabBar.bounds.minY - positionOnY,
                                                          width: width,
                                                          height: height),
                                      cornerRadius: height / 2)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = UIColor.tabBarBackgroundColor.cgColor
        
        let appearance = UITabBarAppearance()
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.tabBarUnselectedItemColor]
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.tabBarSelectedItemColor]
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.tabBarUnselectedItemColor
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.tabBarSelectedItemColor
        appearance.backgroundEffect = .none
        appearance.shadowColor = .clear
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 4
        tabBar.itemPositioning = .centered
        tabBar.standardAppearance = appearance
    }
}
