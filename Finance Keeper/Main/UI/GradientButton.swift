//
// Finance Keeper
// GradientButton.swift

// Created by Bohdan Bondar on 25.08.2022 at 12:51 AM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.
 
// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

final class GradientButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setTitle("+", for: .normal)
        self.titleLabel?.font = UIFont(name: "BrandonGrotesque-Light", size: 100)
        gradientLayer.frame = bounds
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
    }

    lazy var gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.tabBarSelectedItemColor.cgColor, UIColor.tabBarUnselectedItemColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(gradient)
        return gradient
    }()
}
