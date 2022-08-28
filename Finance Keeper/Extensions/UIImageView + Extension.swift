//
// Finance Keeper
// UIImageView + Extension.swift

// Created by Bohdan Bondar on 28.08.2022 at 7:17 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import UIKit

extension UIImageView {
    func load(_ string: String?) {
        guard let string = string else { return }
        guard let url = URL(string: string) else { return }
        DispatchQueue.global().async { [unowned self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
