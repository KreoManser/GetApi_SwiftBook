//
//  NetworkManager.swift
//  GetApi_SwiftBook
//
//  Created by Сергей Бабич on 11.08.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case dataError
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func getAllFruits<T: Decodable>(_ type: T.Type, from url: String, completion: @escaping(Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let fruits = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(fruits))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
