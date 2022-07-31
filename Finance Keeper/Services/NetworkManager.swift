//
// Finance Keeper
// NetworkManager.swift

// Created by Bohdan Bondar on 30.07.2022 at 4:50 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

final class NetworkManager {
    
    static func fetch<T: Codable>(url: URL?, model: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = url else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completionHandler(.failure(error))
                return
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(model.self, from: data)
                    completionHandler(.success(result))
                }
                catch let error {
                    print(error)
                }
            }
        }
        dataTask.resume()
    }
}
