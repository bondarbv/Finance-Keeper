//
// Finance Keeper
// NetworkManager.swift

// Created by Bohdan Bondar on 30.07.2022 at 4:50 PM.
// Copyright (c) 2022 Bohdan Bondar. All rights reserved.

// GitHub: https://github.com/bondarbv
// Linkedin: https://www.linkedin.com/in/bondarbv-ios/


import Foundation

final class NetworkManager {
    
    static func fetch<T: Codable>(url: URL?, model: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = url else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let error = error else {
                return
            }
            
            guard let data = data else {
                completion(.failure(error))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(model.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
